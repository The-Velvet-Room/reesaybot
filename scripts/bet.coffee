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

module.exports = (robot) ->	
  new Poll robot 

  robot.respond /how many points does (.*?) have\??/i, (msg) ->
      username = msg.match[1].toLowerCase()
      points[username] ?= startingPoints
      msg.send username + ' has ' + points[username] + ' points'

  robot.respond /(.*?) points/i, (msg) ->
      username = msg.match[1].toLowerCase()
      points[username] ?= startingPoints
      msg.send username + ' has ' + points[username] + ' points'

  robot.respond /lock bet(s)/i, (msg) ->
        betLocked = true
        msg.send('Alright everyone! Bets are locked!')
       
class Poll

  constructor: (@robot) ->
    @poll = null
    @previousPoll = null

    @robot.brain.on 'loaded', =>
      points = @robot.brain.data.points
      points = {} unless points

    @robot.hear /start bet (.*) -p (.*)/i, this.createPoll
    @robot.respond /winner ([0-2])/i, this.endPoll
    @robot.hear /bet ([0-2]*) ([0-9]*)/i, this.vote
    @robot.respond /show previous bets/i, this.showPreviousPoll

  getUser: (msg) ->
    msg.message.user

  # Poll management
  createPoll: (msg) =>
    answers = this.createAnswers(msg.match[2])
    return msg.send('Please provide 2 participants!') if answers.length != 2

    user = this.getUser(msg)
    @poll = { user: user, question: msg.match[1], answers: answers, cancelled: 0, voters: {}, bets: {}, betChoices: {} }

    msg.send """#{user.name} started a bet: #{@poll.question}
    Bet on a participant by saying: bet <number of choice> <value to bet>
    0. [Opt out]
    #{this.printAnswers()}
    """

  endPoll: (msg) =>
    return msg.send('There’s currently no bet to end.') unless @poll

    victorIndex = parseInt(msg.match[1]) - 1
    betLocked = false
    @poll.victor = @poll.answers[victorIndex].text


    msg.send """Here are the results for “#{@poll.question}”:
    #{this.printResults(@poll)}
    Payouts will now be distributed.
    """

    for username in Object.keys(@poll.betChoices)
    	if @poll.betChoices[username] is victorIndex
    		payoutRatio = (@poll.bets[username] * 100) / (@poll.answers[victorIndex].totalPot)
    		payout = (payoutRatio * @poll.answers[(victorIndex+1)%2].totalPot) / 100
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

  # Bet management
  createAnswers: (answers) ->
    { text: answer, votes: 0, totalPot: 10 } for answer in answers.split(/\s?,\s?/)

  printAnswers: ->
    ("#{i+1}. #{answer.text}" for answer, i in @poll.answers).join("\n")

  printResults: (poll) ->
    poll.answers.sort (a, b) ->
      return 1 if (a.votes < b.votes)
      return -1 if (a.votes > b.votes)
      0

    results = ''
    results += "#{poll.victor} was the victor.\n\n"
    results += ("Name: #{answer.text} - TotalPot: #{answer.totalPot}" for answer in poll.answers).join("\n")

  # Vote management
  vote: (msg) =>
    number = parseInt(msg.match[1])
    bet = parseInt(msg.match[2])
    user = this.getUser(msg)
    if(points[user.name] == undefined || points[user.name] == null)
    	points[user.name] = startingPoints

    # Errors
    return msg.send('Sorry, there’s no pending bet at the moment.') unless @poll
    return msg.send('Sorry! Bets are currently locked!') if betLocked
    return msg.send('Hey! You don\'t have that many points!') if bet > points[user.name]
    return msg.send("Invalid option! There are only #{@poll.answers.length} participants.") if number > @poll.answers.length
    return msg.send("That\'s a negative number!") if bet < 0

    # User already voted
    if (userAnswer = @poll.voters[user.name]) != undefined
      sorry = "Sorry #{user.name}-Senpai, but you’ve already "
      if userAnswer is 0
        sorry += 'opted out.'
      else
        sorry += "bet on “#{userAnswer}. #{@poll.answers[userAnswer - 1].text}”."

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
      @poll.bets[user.name] = bet
      @poll.betChoices[user.name] = number - 1
      msg.send("#{user.name} bet #{bet} on “#{votedAnswer.text}”") 

awardPoints = (msg, username, pts) ->
    try
    	points[username] ?= 0
    	points[username] += parseInt(pts)
    	msg.robot.brain.data.points = points
    catch error
    	msg.send("Whoopsie! I couldn't store the payouts in the DB! Don't worry, I'll use the fallback. Error="+error)
    msg.send(pts + ' points awarded to ' + username)

removePoints = (msg, username, pts) ->
  try
  	points[username] ?= 0
  	points[username] -= parseInt(pts)
  	msg.robot.brain.data.points = points
  catch error
    	msg.send("Whoopsie! I couldn't store the payouts in the DB! Don't worry, I'll use the fallback. Error="+error)	
  msg.send(pts + ' points taken away from ' + username)
  if points[username] <= 0
    points[username] = 50
    msg.send(username + ' has gone bankrupt! Receiving a small bailout of 50.')