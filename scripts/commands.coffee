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
#   <commands>
#
# Author:
#   Camtendo

module.exports = (robot) ->
    robot.hear /commands/i, (msg) ->
        msg.send "You can view ALL of my commands/cues here: https://github.com/Camtendo/reesaybot/tree/master/scripts I hope you can read CoffeeScript, Senpai!"