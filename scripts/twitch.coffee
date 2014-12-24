# Description:
#   Uses the Twitch API to do stuff
#
# Dependencies:
#   None
#
# Configuration:
#   TWITCH_CLIENT_ID
#   TWITCH_ACCESS_TOKEN
#
# Commands:
#   HEAR my viewers - Displays viewer count for whoever says this command
#   HEAR current viewers for <channel> - Shows viewer count for <channel>
#   HEAR my followers - Gives information about followers for the invoking user
#   @DEVONLY status=YOUR_STATUS - Sets status for user. Requires TWITCH_ACCESS_TOKEN to be set.
#   @DEVONLY game=YOUR_GAME - Sets game for user. Requires TWITCH_ACCESS_TOKEN to be set.
#   @DEVONLY who is streaming? - Returns info for streams that are online. Requires TWITCH_ACCESS_TOKEN to be set.
#
# Author:
#   Camtendo

admins =  process.env.ADMINS.split " " || [""]
twitchApi = "https://api.twitch.tv/kraken"
clientId = process.env.TWITCH_CLIENT_ID
accessToken = process.env.TWITCH_ACCESS_TOKEN


module.exports = (robot) ->
  isAdmin = (term) ->
      admins.indexOf(term) isnt -1

  robot.hear /who is streaming?/i, (msg) ->
    msg.http(twitchApi+"/streams/followed")
        .headers('Accept': 'application/vnd.twitchtv.v2+json', 'Client-Id': clientId, 'Authorization': 'OAuth '+accessToken, 'Scope': 'user_read')
        .get() (err, res, body) ->
          try
            json = JSON.parse(body)
            streams = json.streams
            if streams
              msg.send("The following streams are online:")
              for stream in streams then do (stream) =>
                msg.send(""+stream.channel.display_name+" is streaming "+stream.game+" and has "+stream.viewers+" viewers. http://twitch.tv/"+stream.channel.name)
              msg.send("And I think that's it. I hope I helped, Senpai!")
            else
              msg.send("Sorry Senpai, nobody is currently streaming!")
          catch error
            msg.send "Looks like the request failed Senpai. body="+body+" error="+error+" res="+res

  robot.hear /my viewers/i, (msg) ->
      name = msg.message.user.name
      msg.http(twitchApi+"/streams/"+name)
        .headers(Accept: 'application/vnd.twitchtv.v2+json', 'Client-Id': clientId)
        .get() (err, res, body) ->
          try
            json = JSON.parse(body)
            stream = json.stream
            if stream
              msg.send(""+name+"-Senpai, you currently have "+json.stream.viewers+" viewers.")
            else
              msg.send(""+name+", you are currently offline. :/")
          catch error
            msg.send "Looks like the request failed Senpai. error="+error+" body="+body+" name="+name

  robot.hear /current viewers for (.*)/i, (msg) ->
      name = msg.match[1].substr(msg.match[1].indexOf("for ") + 1)
      msg.http(twitchApi+"/streams/"+name)
        .headers(Accept: 'application/vnd.twitchtv.v2+json', 'Client-Id': clientId)
        .get() (err, res, body) ->
          try
            json = JSON.parse(body)
            stream = json.stream
            if stream
              msg.send(""+name+" currently has "+json.stream.viewers+" viewers.")
            else
              msg.send(""+name+" is currently offline.")
          catch error
            msg.send "Looks like the request failed Senpai. error="+error+" body="+body+" name="+name

  robot.hear /my followers/i, (msg) ->
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
    return msg.send("Sorry, you don't have permissions to change Camtendo's game, #{msg.message.user.name}-Senpai.") if !isAdmin msg.message.user.name
    name = msg.message.user.name
    game = msg.match[1].substr(msg.match[1].indexOf("=") + 1)
    data = {"channel": {"game": game}}
    stringQuery = JSON.stringify(data)
    contentLength = stringQuery.length

    msg.http(twitchApi+"/channels/"+name+"?channel[game]="+game)
        .headers('Accept': 'application/vnd.twitchtv.v2+json', 'Client-Id': clientId, 'Authorization': 'OAuth '+accessToken, 'Scope': 'channel_editor', 'Content-Length': contentLength)
        .put(stringQuery) (err, res, body) ->
          try
            json = JSON.parse(body)
            msg.send('Okay '+name+'-Senpai! Your current game is now '+json.game+'!')
          catch error
            msg.send "Looks like the request failed Senpai. body="+body+" error="+error+" res="+res

  robot.hear /status=(.*)?/i, (msg) ->
    return msg.send("Sorry, you don't have permissions to change Camtendo's status, #{msg.message.user.name}-Senpai.") if !isAdmin msg.message.user.name
    name = msg.message.user.name
    status = msg.match[1].substr(msg.match[1].indexOf("=") + 1)
    data = {"channel": {"status": status}}
    stringQuery = JSON.stringify(data)
    contentLength = stringQuery.length

    msg.http(twitchApi+"/channels/"+name+"?channel[status]="+status)
        .headers('Accept': 'application/vnd.twitchtv.v2+json', 'Client-Id': clientId, 'Authorization': 'OAuth '+accessToken, 'Scope': 'channel_editor', 'Content-Length': contentLength)
        .put(stringQuery) (err, res, body) ->
          try
            json = JSON.parse(body)
            msg.send('Okay '+name+'-Senpai! Your current status is now '+json.status+'!')
          catch error
            msg.send "Looks like the request failed Senpai. body="+body+" error="+error+" res="+res
