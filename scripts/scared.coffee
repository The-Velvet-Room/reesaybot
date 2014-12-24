# Description:
#   Abolish all fear from your chat room. Hubot will calm those in peril with a
#   recitation of the Litany Against Fear.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   HEAR fear|afraid - Recite the Litany Against Fear
#
# Author:
#   wgibbs

litany = "There's nothing to be afraid of Senpai! You're the best!"

module.exports = (robot) ->
  robot.hear /(afraid|fear)/i, (msg) ->
    msg.send litany
