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
      	msg.send "Heroku deployment successful. "+msg.robot.commands.length+" commands were loaded. Twitch Build Hash = "+uniqueId(16)

  robot.leave (msg) ->
      msg.send "#{msg.message.user.name} left..."

  uniqueId = (length=8) ->
	  id = ""
	  id += Math.random().toString(36).substr(2) while id.length < length
	  id.substr 0, length