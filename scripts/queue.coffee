# Description:
#   Basic Queue
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   HEAR queue - list items in the queue
#   HEAR add (item) - add item to queue
#   ADMIN RESPOND complete (item) - mark item as complete
#   ADMIN RESPOND remove (item) - remove item from queue
#   HEAR completed items - shows what items have been completed
#
# Author:
#   Camtendo

admins =  process.env.ADMINS.split " " || [""]

module.exports = (robot) ->

  robot.brain.data.groceryList =
    toBuy: {},
    purchased: {}
  groceryList =
    get: ->
      Object.keys(robot.brain.data.groceryList.toBuy)

    getPurchased: ->
      Object.keys(robot.brain.data.groceryList.purchased)

    add: (item) ->
      robot.brain.data.groceryList.toBuy[item] = true

    remove: (item) ->
      delete robot.brain.data.groceryList.toBuy[item]
      true

    bought: (item) ->
      delete robot.brain.data.groceryList.toBuy[item]
      robot.brain.data.groceryList.purchased[item] = true

  robot.hear /queue$/i, (msg) ->
    list = groceryList.get().join("\n") || "No items in the queue Senpai!"
    msg.send list

  robot.hear /add (.*)/i, (msg) ->
    item = msg.match[1].trim()
    groceryList.add item
    msg.send "Ok, added #{item} to the queue!"

  robot.respond /complete (.*)/i, (msg) ->
    return msg.send("Sorry, you don't have permissions to use this command, #{msg.message.user.name}-Senpai.") if !isAdmin msg.message.user.name
    item = msg.match[1].trim()
    groceryList.bought item
    msg.send "Ok, marked #{item} as complete."

  robot.respond /remove (.*)/i, (msg) ->
    return msg.send("Sorry, you don't have permissions to use this command, #{msg.message.user.name}-Senpai.") if !isAdmin msg.message.user.name
    item = msg.match[1].trim()
    groceryList.remove item
    msg.send "Ok, removed #{item} from the queue."

  robot.hear /completed items/i, (msg) ->
    list = groceryList.getPurchased().join("\n") || "You haven't completed anything, Senpai."
    msg.send list

  isAdmin = (term) ->
    admins.indexOf(term) isnt -1
