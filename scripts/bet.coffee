# Description:
#   Allows betting in competitive based games similar to Saltybet.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#	None
#	
# Author:
#   Camtendo

points = {}
totalPot = {}
startingPoints = 1000
betLocked = false

awardPoints = (msg, username, pts) ->
    points[username] ?= 0
    points[username] += parseInt(pts)
    msg.send pts + ' awarded to ' + username
    save(robot)

removePoints = (msg, username, pts) ->
	points[username] -= parseInt(pts)
    msg.send pts + ' points taken away from ' + username
    if points[username] <= 0
    	msg.send username + ' has gone bankrupt! Receiving a small bailout of 50.'
     	points[username] = 50
    save(robot)

save = (robot) ->
    robot.brain.data.points = points

module.exports = (robot) ->
    robot.brain.on 'loaded', ->
        points = robot.brain.data.points or {}

    robot.respond /how many points does (.*?) have\??/i, (msg) ->
        username = msg.match[1]
        points[username] ?= startingPoints
        msg.send username + ' has ' + points[username] + ' points'

    robot.respond /(.*?) points/i, (msg) ->
        username = msg.match[1]
        points[username] ?= startingPoints
        msg.send username + ' has ' + points[username] + ' points'

       
class Poll

  constructor: (@robot) ->
    @poll = null
    @previousPoll = null

    @robot.respond /poll (.*) -a (.*)/i, this.createPoll
    @robot.respond /victor is option ([0-2])/i, this.endPoll
    @robot.respond /bet ([0-2]*) ([0-9]*)/i, this.vote
    @robot.respond /show previous bets/i, this.showPreviousPoll

  getUser: (msg) ->
    msg.message.user

  # Poll management
  createPoll: (msg) =>
    answers = this.createAnswers(msg.match[2])
    return msg.send('Please provide 2 participants!') if answers.length != 2

    user = this.getUser(msg)
    #Used to prevent anyone from making bets
    if user.name is camtendo
    @poll = { user: user, question: msg.match[1], answers: answers, cancelled: 0, voters: {} }

    msg.send """#{user.name} started a bet: #{@poll.question}
    0. [Cancel my bet]
    #{this.printAnswers()}
    """

  endPoll: (msg) =>
    return msg.send('There’s currently no bet to end.') unless @poll

    victorIndex = parseInt(msg.match[1]) - 1
    betLocked = false
    @poll.victor = @poll.answers[victorIndex]

    msg.send """Here are the results for “#{@poll.question}”:
    #{@poll.victor} won.
    #{this.printResults(@poll)}
    Payouts will now be distributed.
    """

    for username in Object.keys(@poll.betChoices)
    	if @poll.betChoices[username] is victorIndex
    		payoutRatio = (@poll.bets[username] * 100) / (@poll.answers[victorIndex].totalPot)
    		payout = (payoutRatio * @poll.answers[(victorIndex+1)%2]) / 100
    		awardPoints(msg, username, payout)
    	else
    		removePoints(msg, username, @poll.bets[username])

    @previousPoll = @poll
    @poll = null

  showPreviousPoll: (msg) =>
    return msg.send('There are currently no previous results.') unless @previousPoll

    msg.send """Here are the results for “#{@previousPoll.question}”:
    #{this.printResults(@previousPoll)}
    """

  # Ansers management
  createAnswers: (answers) ->
    { text: answer, votes: 0 } for answer in answers.split(/\s?,\s?/)

  printAnswers: ->
    ("#{i+1}. #{answer.text}" for answer, i in @poll.answers).join("\n")

  printResults: (poll) ->
    poll.answers.sort (a, b) ->
      return 1 if (a.votes < b.votes)
      return -1 if (a.votes > b.votes)
      0

    results = ''
    results += "#{poll.victor} was the vicor.\n\n"
    results += ("#{answer.text} (#{answer.totalPot})" for answer in poll.answers).join("\n")
    results += "\n\n#{poll.cancelled} canceled their bet."

  # Vote management
  vote: (msg) =>
    number = parseInt(msg.match[1])
    bet = parseInt(msg.match[2])
    user = this.getUser(msg)

    # Errors
    return msg.send('Sorry, there’s no pending bet at the moment.') unless @poll
    return msg.send('Sorry! Bets are currently locked!') if betLocked
    return msg.send("Invalid option! There are only #{@poll.answers.length} participants.") if number > @poll.answers.length

    # User already voted
    if (userAnswer = @poll.voters[user.name]) != undefined
      sorry = "Sorry #{user.name}-Senpai, but you’ve already "
      if userAnswer is 0
        sorry += 'cancelled your bet.'
      else
        sorry += "voted for “#{userAnswer}. #{@poll.answers[userAnswer - 1].text}” for this poll."

      return msg.send(sorry)

    # Save user vote
    @poll.voters[user.name] = number
    votersCount = Object.keys(@poll.voters).length

    # Cancel vote
    if number is 0
      @poll.cancelled++
      msg.send("#{user.name} decided not to bet this time.")

    # Cast vote
    else
      votedAnswer = @poll.answers[number - 1]
      votedAnswer.votes++
      votedAnswer.totalPot += bet
      @poll.bet[user.name] = bet
      @poll.betChoices[user.name] = number - 1
      msg.send "#{user.name} bet #{bet} on “#{votedAnswer.text}”" 

module.exports = (robot) ->
  new Poll(robot)

  robot.respond /lock bet(s)/i, (msg) ->
        betLocked = true
        msg.send('Alright everyone! Bets are locked!')