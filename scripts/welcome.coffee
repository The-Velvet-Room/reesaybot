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
  robot.enter (response) ->
      msg.send "Welcome, #{response.message.user.name}!"