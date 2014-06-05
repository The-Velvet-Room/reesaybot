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
#   Triggered by Should I
# 
# Author:
#   Camtendo

replys = [
    "Yeah! Do it!"
    "Of course you should!"
    "Duh. Why wouldn't you?"
    "Definitely Senpai!"
]

module.exports = (robot) ->
  robot.hear /bee yee/i, (msg) ->
    msg.send "Aaaaaaaaooooooooooowwwwwwwww!"

  robot.hear /beeyee/i, (msg) ->
  	msg.send "BEE YEE!"