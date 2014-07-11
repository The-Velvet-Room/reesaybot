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
#   my points - see your points
#   (user) points - see (user's) points
#   bet (choiceIndex) (amount) - bet a certain amount on the choice. Choice index is either 1 or 2
#   hubot how many points does (user) have? - Shows user's points
#   all in (choice) - Bet all your available points on (choice)
#	
# Author:
#   Camtendo

admins = {"camtendo", "t0asterb0t"}
points = {}
highestPoints = {}
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
      <tr><th>Name</th><th>Points</th><th>Peak</th></tr>
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
    keys = Object.keys(points)
    sortedKeys = keys.sort (a, b) -> points[b] - points[a]
    for name in sortedKeys
      highestPoints[name] ?= points[name]
      html += "<tr> <td>#{name}</td><td>#{points[name]}</td><td>#{highestPoints[name]}</td></tr>"
    res.end leaderboardContents robot.name, html

  robot.router.get '/points/current-bet', (req, res) ->
    res.setHeader 'content-type', 'text/html'
    @poll = poll
    votersCount = Object.keys(@poll.voters).length
    odds = ""+(((@poll.answers[0].totalPot) / (@poll.answers[1].totalPot)).toFixed 4)+" to 1"
    odds = "1 to "+(((@poll.answers[1].totalPot) / (@poll.answers[0].totalPot)).toFixed 4) if @poll.answers[1].totalPot > @poll.answers[0].totalPot
    leftSide = ""+@poll.answers[0].text+" - "+@poll.answers[0].totalPot
    rightSide = ""+@poll.answers[1].text+" - "+@poll.answers[1].totalPot
    leftBets = []
    rightBets = []
    for name, thing of @poll.betChoices
      bet = @poll.bets[name]
      risk = ""+((100*bet/points[name]).toFixed 2)+"%"
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

  robot.respond /(.*?) points$/i, (msg) ->
      username = msg.match[1].toLowerCase()
      points[username] ?= startingPoints
      msg.send username + ' has ' + points[username] + ' points'

  robot.hear /(.*?) set points (.?)/i, (msg) ->
      return msg.send("Sorry, you don't have permissions to override points, #{msg.message.user.name}-Senpai.") if msg.message.user.name != "camtendo"
      username = msg.match[1].toLowerCase()
      newPoints = msg.message.text.substr(msg.message.text.indexOf("points ") + 7) 
      points[username] = 0
      awardPoints(msg, username, newPoints)

  robot.hear /(.*?) set peak (.?)/i, (msg) ->
      return msg.send("Sorry, you don't have permissions to override peak points, #{msg.message.user.name}-Senpai.") if msg.message.user.name != "camtendo"
      username = msg.match[1].toLowerCase()
      newPoints = msg.message.text.substr(msg.message.text.indexOf("peak ") + 5) 
      highestPoints[username] = newPoints
      msg.send(""+username+" has a new peak of "+newPoints)

  robot.hear /my points$/i, (msg) ->
      username = msg.message.user.name.toLowerCase()
      points[username] ?= startingPoints
      msg.send username+'-Senpai, you' + ' have ' + points[username] + ' points'

  robot.respond /lock bet(s)/i, (msg) ->
        return msg.send("Sorry, you don't have permissions to lock bets, #{msg.message.user.name}-Senpai.") if !isAdmin msg.message.user.name
        betLocked = true
        msg.send('Alright everyone! Bets are locked! View bets here: http://reesaybot.herokuapp.com/points/current-bet')

  uniqueId = (length=8) ->
    id = ""
    id += Math.random().toString(36).substr(2) while id.length < length
    id.substr 0, length

  isAdmin = (term) -> 
    admins.indexOf(term) isnt -1
       
class Poll

  constructor: (@robot) ->
    @poll = null
    @previousPoll = null

    @robot.brain.on 'loaded', =>
      points = @robot.brain.data.points
      highestPoints = @robot.brain.data.highestPoints
      points = {} unless points
      highestPoints = {} unless highestPoints

    @robot.hear /start bet (.*) -p (.*)/i, this.createPoll
    @robot.respond /winner ([0-2])/i, this.endPoll
    @robot.hear /bet ([0-2]*) ([0-9]*)/i, this.vote
    @robot.hear /all in ([0-2]*)/i, this.allInVote
    @robot.respond /show previous bets/i, this.showPreviousPoll

  getUser: (msg) ->
    msg.message.user

  # Poll management
  createPoll: (msg) =>
    return msg.send("Sorry, you don't have permissions to start a bet, #{msg.message.user.name}-Senpai.") if !isAdmin msg.message.user.name
    answers = this.createAnswers(msg.match[2])
    return msg.send('Please provide 2 participants!') if answers.length != 2

    user = this.getUser(msg)
    betLocked = false
    @poll = { user: user, question: msg.match[1], answers: answers, cancelled: 0, voters: {}, bets: {}, betChoices: {} }

    msg.send """#{user.name} started a bet: #{@poll.question}
    Bet on a participant by saying: bet <number of choice> <value to bet>
    #{this.printAnswers()}
    Bets will lock in 60 seconds.
    """
    setTimeout ->
      msg.send("30 seconds remaining to bet!")
    , 30000

    setTimeout ->
      msg.send("10 seconds remaining to bet!")
    , 50000

    setTimeout ->
      lockBets(msg)
    , 60000

  endPoll: (msg) =>
    return msg.send('There’s currently no bet to end.') unless @poll
    return msg.send('Sorry, bets are still able to be made.') unless betLocked
    return msg.send("Sorry, you don't have permissions to declare a winner, #{msg.message.user.name}-Senpai.") if !isAdmin msg.message.user.name

    poll = @poll
    victorIndex = parseInt(msg.match[1]) - 1
    @poll.victor = @poll.answers[victorIndex].text


    msg.send """Here are the results for “#{@poll.question}”:
    #{this.printResults(@poll)}
    Payouts will now be distributed.
    The leaderboard will be updated shortly: #{leaderboardUrl}
    """

    for username in Object.keys(@poll.betChoices)
      if @poll.betChoices[username] is victorIndex
        payoutRatio = (@poll.bets[username]) / (@poll.answers[victorIndex].totalPot)
        payout = (payoutRatio * @poll.answers[0].totalPot).toFixed 0
        payout = (payoutRatio * @poll.answers[1].totalPot).toFixed 0 if victorIndex == 0
        payout = 1 if payout < 1
        payout = 1 if payout > @poll.answers[0].totalPot + @poll.answers[1].totalPot
        awardPoints(msg, username, payout)
      else
        removePoints(msg, username, @poll.bets[username])

    @previousPoll = @poll
    @poll = null
    betLocked = false

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
    return msg.send("Invalid option! There are only #{@poll.answers.length} participants.") if number <= 0
    return msg.send("That\'s an invalid bet amount!") if bet <= 0

    # User already voted
    if (userAnswer = @poll.voters[user.name]) != undefined
        previousAnswer = @poll.answers[@poll.betChoices[user.name]]
        previousAnswer.totalPot -= @poll.bets[user.name]
        previousAnswer.votes--

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

  #Go hard or go home
  allInVote: (msg) =>
    number = parseInt(msg.match[1])    
    user = this.getUser(msg)
    if(points[user.name] == undefined || points[user.name] == null)
      points[user.name] = startingPoints

    bet = points[user.name]
    # Errors
    return msg.send('Sorry, there’s no pending bet at the moment.') unless @poll
    return msg.send('Sorry! Bets are currently locked!') if betLocked
    return msg.send('Hey! You don\'t have that many points!') if bet > points[user.name]
    return msg.send("Invalid option! There are only #{@poll.answers.length} participants.") if number > @poll.answers.length
    return msg.send("Invalid option! There are only #{@poll.answers.length} participants.") if number <= 0
    return msg.send("That\'s an invalid bet amount!") if bet <= 0

    # User already voted
    if (userAnswer = @poll.voters[user.name]) != undefined
        previousAnswer = @poll.answers[@poll.betChoices[user.name]]
        previousAnswer.totalPot -= @poll.bets[user.name]
        previousAnswer.votes--

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

lockBets = (msg) ->
    betLocked = true
    msg.send('Alright everyone! Bets are locked! View bets here: http://reesaybot.herokuapp.com/points/current-bet')

awardPoints = (msg, username, pts) ->
    try
      points[username] ?= 0
      points[username] += parseInt(pts)
      highestPoints[username] = points[username] if points[username] > highestPoints[username]
      msg.robot.brain.data.points = points
      msg.robot.brain.data.highestPoints = highestPoints
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