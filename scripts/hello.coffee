# Description:
#   Hubot, be polite and say hello.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   HEAR Hello or Good Day make hubot say hello to you back
#   HEAR Good Morning makes hubot say good morning to you back
hellos = [
    "Well hello there, %-Senpai!",
    "Hey %-Senpai, Hello!",
    "Hey there, %-Senpai!",
    "Good day, %-Senpai."
]
mornings = [
    "Good morning, %-Senpai.",
    "Good morning to you too, %-Senpai!",
    "Good day, %-Senpai"
]
module.exports = (robot) ->
    robot.hear /(hello|good( [d'])?ay(e)?)/i, (msg) ->
        hello = msg.random hellos
        msg.send hello.replace "%", msg.message.user.name

    robot.hear /(^(good )?m(a|o)rnin(g)?)/i, (msg) ->
        hello = msg.random mornings
        msg.send hello.replace "%", msg.message.user.name
