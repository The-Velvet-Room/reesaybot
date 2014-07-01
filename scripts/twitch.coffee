# Description:
#   Uses the Twitch api to do stuff
#
# Dependencies:
#   None
#
# Configuration:
#   TWITCH_CLIENT_ID
#
# Commands:
#   None.
#
# Author:
#   Camtendo

twitchApi = "https://api.twitch.tv/kraken"
clientId = process.env.TWITCH_CLIENT_ID 

module.exports = (robot) ->
  robot.hear /twitch followers/i, (msg) ->
  	  name = msg.message.user.name
  	  msg.http(twitchApi+"/channels/"+name+"/follows")
  	  	.headers(Accept: 'application/vnd.twitchtv.v2+json', 'Client-Id': clientId)
  	  	.get() (err, res, body) ->
  	  		try
  	  			json = JSON.parse(body)
  	  			msg.send(name+", you have "+json._total+" followers. The most recent are "+json.follows[0].user.name+", "+json.follows[1].user.name+", and "+json.follows[2].user.name+".")
  	  		catch error
  	  			msg.send "Looks like the request failed Senpai. :("