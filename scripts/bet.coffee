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
#	  hubot leaderboard - Request the leaderboard url.
#	
# Author:
#   Camtendo

points = {}
totalPot = {}
poll = null
startingPoints = 100
betLocked = false
leaderboardUrl = 'http://reesaybot.herokuapp.com/points/leaderboard'
currentBetUrl = 'http://reesaybot.herokuapp.com/points/current-bet'

leaderboardContents = (name, points) ->

  """
<html>
  <head>
  <title>Leaderboard</title>
  <style type="text/css">
    body {
      background: #d3d6d9;
      color: #636c75;
      text-shadow: 0 1px 1px rgba(255, 255, 255, .5);
      font-family: Helvetica, Arial, sans-serif;
    }
    h1 {
      margin: 8px 0;
      padding: 0;
    }
    .points {
      font-size: 13px;
      border-style: dashed;
      text-align: left;
      border-spacing: 10px;
    }
  </style>
  </head>
  <body>
    <center><h1>Points</h1></center>
    <center><table class="points">
      <tr><th>Name</th><th>Points</th></tr>
      #{points}
    </table></center>
  </body>
</html>
  """

currentBetContents = (totalBets, leftBetChoice, rightBetChoice, odds, table) ->

  """
<html>
  <head>
  <title>Current Bet</title>
  <style type="text/css">
    body {
      background: #d3d6d9;
      color: #636c75;
      text-shadow: 0 1px 1px rgba(255, 255, 255, .5);
      font-family: Helvetica, Arial, sans-serif;
    }
    h1 {
      margin: 8px 0;
      padding: 0;
    }
    .points {
      font-size: 13px;
      border-style: dashed;
      text-align: left;
      border-spacing: 10px;
    }
  </style>
  </head>
  <body>
    <center><h1>Total Bets: #{totalBets}</h1></center>
    <center><h1>Odds: #{odds}</h1></center>
    <center><table class="points">
      <tr><th>#{leftBetChoice}</th><th>#{rightBetChoice}</th></tr>
      #{table}
    </table></center>
  </body>
</html>
  """

module.exports = (robot) ->	
  new Poll robot 

  robot.router.get '/points/leaderboard', (req, res) ->
    res.setHeader 'content-type', 'text/html'
    html = ''
    for name, num of points
      html += "<tr> <td>#{name}</td><td>#{num}</td> </tr>"
    res.end leaderboardContents robot.name, html

  robot.router.get '/points/current-bet', (req, res) ->
    res.setHeader 'content-type', 'text/html'
    @poll = poll
    votersCount = Object.keys(@poll.voters).length
    odds = ""+(@poll.answers[0].totalPot) / (@poll.answers[1].totalPot)+" to 1"
    odds = "1 to "+(@poll.answers[1].totalPot) / (@poll.answers[0].totalPot) if @poll.answers[1].totalPot > @poll.answers[0].totalPot
    leftSide = ""+@poll.answers[0].text+" - "+@poll.answers[0].totalPot
    rightSide = ""+@poll.answers[1].text+" - "+@poll.answers[1].totalPot
    leftBets = ["t","t2","t3"]
    rightBets = []
    for name, thing in @poll.betChoices
      leftBets.push thing
      bet = @poll.bets[name]
      risk = ""+(100*bet/points[name])+"%"
      leftBets.push "Reversed refs" if name == 0
      leftBets.push "Reversed refs" if name == 1
      leftBets.push "wtf" if name == "camtendo"
      leftBets.push "#{name} - #{bet} (#{risk})" if @poll.betChoices[name] == 0
      rightBets.push "#{name} - #{bet} (#{risk})" if @poll.betChoices[name] == 1
    tableSize = leftBets.length
    tableSize = rightBets.length if rightBets.length > leftBets.length
    table = ''
    for i in [0..tableSize] by 1
      leftCell = "<td>Empty</td>"
      leftCell = "<td>#{leftBets[i]}</td>" if leftBets[i]
      rightCell = "<td>Empty</td>"
      rightCell = "<td>#{rightBets[i]}</td>" if rightBets[i]
      table += "<tr>#{leftCell}#{rightCell}</tr>"
    res.end currentBetContents votersCount, leftSide, rightSide, odds, table

  robot.respond /leaderboard/i, (msg) ->
      msg.send leaderboardUrl

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
        msg.send('Alright everyone! Bets are locked! View bets here: http://reesaybot.herokuapp.com/points/current-bet')

  uniqueId = (length=8) ->
    id = ""
    id += Math.random().toString(36).substr(2) while id.length < length
    id.substr 0, length
       
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
    return msg.send("Sorry, you don't have permissions to start a bet, #{msg.message.user.name}-Senpai.") if msg.message.user.name != "camtendo"
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
    The leaderboard has been updated: #{leaderboardUrl}
    """

    for username in Object.keys(@poll.betChoices)
      if @poll.betChoices[username] is victorIndex
        payoutRatio = (@poll.bets[username]) / (@poll.answers[(victorIndex+1)%2].totalPot)
        payoutRatio = (@poll.bets[username]) / (@poll.answers[victorIndex].totalPot) if victorIndex is 0
        payout = (payoutRatio * @poll.answers[victorIndex].totalPot)
        payout = (payoutRatio * @poll.answers[(victorIndex+1)%2].totalPot) if victorIndex is 0
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
    poll = @poll

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
      poll = @poll
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