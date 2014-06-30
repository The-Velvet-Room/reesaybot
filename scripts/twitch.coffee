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
  	  			msg.send ""+name+" your followers are "+json.follows[0]
  	  		catch error
  	  			msg.send "Looks like the request failed Senpai. :("