# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   RESPOND hubot ping - Reply with pong
#   HEAR ~echo (text) - Reply back with (text)
#   RESPOND hubot time - Reply with current time
#   RESPOND hubot die - End hubot process

module.exports = (robot) ->
  robot.respond /PING$/i, (msg) ->
    msg.send "PONG"

  robot.hear /~ECHO (.*)$/i, (msg) ->
    msg.send msg.match[1] if msg.match[1].substring(0,1) != '!'

  robot.respond /TIME$/i, (msg) ->
    msg.send "Server time is: #{new Date()}"

  robot.respond /DIE$/i, (msg) ->
    msg.send "What did I do to deserve this, Senpai? Idols can't die btw. ;)"

  robot.hear /test$/i, (msg) ->
  	msg.send "I'm alive, Senpai!"
