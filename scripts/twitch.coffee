# Description:
#   Uses the Twitch api to do stuff
#
# Dependencies:
#   None
#
# Configuration:
#   TWITCH_CLIENT_ID
#	TWITCH_ACCESS_TOKEN
#
# Commands:
#   None.
#
# Author:
#   Camtendo

twitchApi = "https://api.twitch.tv/kraken"
clientId = process.env.TWITCH_CLIENT_ID
accessToken = process.env.TWITCH_ACCESS_TOKEN


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


  robot.hear /game=(.*)?/i, (msg) ->
  	name = msg.message.user.name
  	game = msg.match[1].substr(msg.match[1].indexOf("=") + 1)
  	msg.http(twitchApi+"/channels/"+name+"?channel[game]="+game)
  	  	.headers(Accept: 'application/vnd.twitchtv.v2+json', 'Client-Id': clientId, 'Authorization': 'OAuth '+accessToken, 'scope': 'channel_editor')
  	  	.put() (err, res, body) ->
  	  		try
  	  			json = JSON.parse(body)
  	  			msg.send('Okay '+name+'-Senpai! Your current game is now '+game+'!')
  	  		catch error
  	  			msg.send "Looks like the request failed Senpai."
  	  			throw error