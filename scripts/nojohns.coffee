# Description:
#   Summons the wisdom of Reggie.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   HEAR no johns
#
# Author:
#   Brendan Smith

module.exports = (robot) ->
  robot.hear /no johns/i, (msg) ->
    msg.send "https://s3.amazonaws.com/hudl-internal-assets/vaSQoCl.gif"