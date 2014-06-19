# Description:
#   Welcome users to the room.
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
      msg.send "Welcome, #{msg.message.user.name}!"