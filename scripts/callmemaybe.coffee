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
#   HEAR "call me maybe"
#
# Author:
#   unknown

module.exports = (robot) ->
  robot.hear /.*i just met you.*/, (msg) ->
          msg.send "And this is craaaaazy!"
  robot.hear /.*here's my number.*/, (msg) ->
          msg.send "So call me maybe?"

