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
      msg.send "Hey everyone, I'm Rise Kujikawa!"

  robot.leave (msg) ->
      msg.send "Shutting down!"