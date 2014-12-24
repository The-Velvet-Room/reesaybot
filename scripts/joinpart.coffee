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
#   PASSIVE Reesaybot will listen for admin joins and parts and report them.
#
# Author:
#   Camtendo

admins =  process.env.ADMINS.split " " || [""]

module.exports = (robot) ->
  robot.enter (msg) ->
  	  if msg.message.user.name.toLowerCase() isnt robot.name.toLowerCase()
      	msg.send "Welcome to the channel, #{msg.message.user.name}-Senpai! I've loaded special commands for you!" if isAdmin msg.message.user.name
      else
      	msg.send "Heroku deployment successful. "+msg.robot.commands.length+" commands were loaded. Twitch Build Hash = "+uniqueId(16)

  #robot.leave (msg) ->
  #    msg.send "#{msg.message.user.name} left..."

  uniqueId = (length=8) ->
	  id = ""
	  id += Math.random().toString(36).substr(2) while id.length < length
	  id.substr 0, length

  isAdmin = (term) ->
    admins.indexOf(term) isnt -1