# Description:
# Searches imgur.com for a gif
#
# Dependencies:
# None
#
# Configuration:
# Store your imgur.com application client id in an environment
# variable called IMGUR_CLIENT_ID. To get api access, visit
# http://api.imgur.com and register an application.
#
# Commands:
# HEAR gif me (keyword) - Returns a link to a gif about (keyword)
#
# Author:
# brickattack

module.exports = (robot) ->
  robot.hear /gif me (.*)/i, (msg) ->
    search = escape(msg.match[1])
    client_id = 'Client-ID ' + process.env.IMGUR_CLIENT_ID
    msg.http('https://api.imgur.com/3/gallery/search')
      .headers(Authorization: client_id)
      .query(q: search)
      .get() (err, res, body) ->
        images = JSON.parse(body).data
        if images.length > 0
          image = msg.random images
          msg.send image.link
        else
          msg.send "Sorry Senpai, I'm not able to get you a gif right now."