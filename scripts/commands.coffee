# Description:
#   Get command source code
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   commands - Lists url to view all commands
#
# Author:
#   Camtendo

module.exports = (robot) ->
    robot.hear /commands/i, (msg) ->
        msg.send "You can view ALL of my commands/cues here: http://reesaybot.herokuapp.com/"