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
#	HEAR What should I speedrun? - hubot will suggest a game for you
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
