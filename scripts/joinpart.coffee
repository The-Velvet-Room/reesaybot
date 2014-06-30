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
#   None. Listens for join and part messages.
#
# Author:
#   Camtendo

module.exports = (robot) ->
  robot.enter (msg) ->
  	  if msg.message.user.name.toLowerCase() isnt robot.name.toLowerCase()
      	msg.send "Welcome to the channel, #{msg.message.user.name}-Senpai!"
      else
      	msg.send "Heroku deployment successful."

  robot.leave (msg) ->
      msg.send "#{msg.message.user.name} left..."