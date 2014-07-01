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
#   Bee Yee - Aaaaaaaaooooooooooowwwwwwwww
#   beeyee - BEE YEE!
# 
# Author:
#   Camtendo

module.exports = (robot) ->
  robot.hear /bee yee/i, (msg) ->
    msg.send "Aaaaaaaaooooooooooowwwwwwwww!"

  robot.hear /beeyee/i, (msg) ->
  	msg.send "BEE YEE!"