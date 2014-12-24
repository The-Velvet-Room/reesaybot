# Description:
#   Call Me Maybe
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   HEAR i just met you OR here's my number
#
# Author:
#   unknown

module.exports = (robot) ->
  robot.hear /i just met you/i, (msg) ->
          msg.send "And this is craaaaazy!"
  robot.hear /here's my number/i, (msg) ->
          msg.send "So call me maybe?"
