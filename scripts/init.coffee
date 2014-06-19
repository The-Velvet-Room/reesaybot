# Description:
#   Messages to say on enter and exit
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None. Listens for join messages.
#
# Author:
#   Camtendo

module.exports = (robot) ->
  robot.enter (msg) ->
      msg.send "#{msg.message.user.name} has joined the room!"

  robot.leave (msg) ->
      msg.send "#{msg.message.user.name} left us..."