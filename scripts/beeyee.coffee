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
#   HEAR Bee Yee - Aaaaaaaaooooooooooowwwwwwwww
#   HEAR beeyee - BEE YEE!
# 
# Author:
#   Camtendo

module.exports = (robot) ->
  robot.hear /bee yee/i, (msg) ->
    msg.send "Aaaaaaaaooooooooooowwwwwwwww!"

  robot.hear /beeyee/i, (msg) ->
  	msg.send "BEE YEE!"