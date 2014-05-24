# Description:
#   Suggests a game to speed run using my API
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#	What should I speedrun?
#
#
# Author:
#   Camtendo

module.exports = (robot) ->
  robot.hear /what (game\s)?should i speed(\s)?run/i, (msg) ->
    robot.http('http://whatshouldispeedrun.appspot.com/')
      .get() (err, res, body) ->
        game = body
        msg.send game
