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
  	  if msg.message.user.name.toLowerCase() isnt robot.name.toLowerCase()
      	msg.send "Welcome to the channel, #{msg.message.user.name}!"
      else
      	msg.send "I'm here! :D"

  robot.leave (msg) ->
      msg.send "#{msg.message.user.name} left..."