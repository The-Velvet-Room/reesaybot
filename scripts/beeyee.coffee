# Description:
#   BEE YEE
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   Bee Yee, BEEYEE
# 
# Author:
#   Camtendo

module.exports = (robot) ->
  robot.hear /bee yee/i, (msg) ->
    msg.send "Aaaaaaaaooooooooooowwwwwwwww!"

  robot.hear /beeyee/i, (msg) ->
  	msg.send "BEE YEE!"