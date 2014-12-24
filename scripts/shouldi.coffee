# Description:
#   Encourages you to do what ever you're asking. Doesn't respond to comparative statements
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   HEAR Should I (something) or (something else) - Encourages you to do stuff.
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
  robot.hear /^should I((\s)+(\w(?! or ))+)+/i, (msg) ->
    msg.send msg.random replys
