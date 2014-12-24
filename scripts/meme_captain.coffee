# Description:
#   Get a meme from http://memecaptain.com/
#
# Dependencies:
#   None
#
# Commands:
#   HEAR Y U NO (text) - Generates the Y U NO GUY with the bottom caption of (text)
#   HEAR I don't always <something> but when i do (text) - Generates The Most Interesting man in the World
#   HEAR (text) (SUCCESS|NAILED IT) - Generates success kid with the top caption of (text)
#   HEAR (text) ALL the (things) - Generates ALL THE THINGS
#   HEAR (text) TOO DAMN (high) - Generates THE RENT IS TOO DAMN HIGH guy
#   HEAR Yo dawg (text) so (text) - Generates Yo Dawg
#   HEAR All your (text) are belong to (text) - All your (text) are belong to (text)
#   HEAR If (text), (word that can start a question) (text)? - Generates Philosoraptor
#   HEAR (text), BITCH PLEASE (text) - Generates Yao Ming
#   HEAR (text), COURAGE (text) - Generates Courage Wolf
#   HEAR ONE DOES NOT SIMPLY (text) - Generates Boromir
#   HEAR IF YOU (text) GONNA HAVE A BAD TIME - Ski Instructor
#   HEAR IF YOU (text) TROLLFACE (text) - Troll Face
#   HEAR Aliens guy (text) - Aliens guy weighs in on something
#   HEAR Brace yourself (text) - Ned Stark braces for (text)
#   HEAR Iron Price (text) - To get (text)? Pay the iron price!
#   HEAR Not sure if (something) or (something else) - Generates a Futurama Fry meme
#   HEAR (text), AND IT'S GONE - Bank Teller
#   HEAR WHAT IF I TOLD YOU (text) - Morpheus What if I told you
#
# Author:
#   bobanj

module.exports = (robot) ->
  robot.hear /Y U NO (.+)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/y_u_no.jpg', 'Y U NO', msg.match[1], (url) ->
      msg.send url

  robot.hear /iron price (.+)/i, (msg) ->
    memeGenerator msg, 'http://imgur.com/nqVZQel.jpg', msg.match[1], 'Pay the iron price', (url) ->
      msg.send url

  robot.hear /aliens guy (.+)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/aliens.jpg', msg.match[1], '', (url) ->
      msg.send url

  robot.hear /brace yourself (.+)/i, (msg) ->
    memeGenerator msg, 'http://i.imgur.com/cOnPlV7.jpg', 'Brace Yourself', msg.match[1], (url) ->
      msg.send url

  robot.hear /(.*) (ALL the .*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/all_the_things.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /(I DON'?T ALWAYS .*) (BUT WHEN I DO,? .*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/most_interesting.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /(.*)(SUCCESS|NAILED IT.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/success_kid.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /(.*) (\w+\sTOO DAMN .*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/too_damn_high.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /(NOT SURE IF .*) (OR .*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/fry.png', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /(YO DAWG .*) (SO .*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/xzibit.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /(All your .*) (are belong to .*)/i, (msg) ->
    memeGenerator msg, 'http://i.imgur.com/gzPiQ8R.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /(.*)\s*BITCH PLEASE\s*(.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/yao_ming.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /(.*)\s*COURAGE\s*(.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/courage_wolf.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /ONE DOES NOT SIMPLY (.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/boromir.jpg', 'ONE DOES NOT SIMPLY', msg.match[1], (url) ->
      msg.send url

  robot.hear /(IF YOU .*\s)(.* GONNA HAVE A BAD TIME)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/bad_time.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /(.*)TROLLFACE(.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/troll_face.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /(IF .*), ((ARE|CAN|DO|DOES|HOW|IS|MAY|MIGHT|SHOULD|THEN|WHAT|WHEN|WHERE|WHICH|WHO|WHY|WILL|WON\'T|WOULD)[ \'N].*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/philosoraptor.jpg', msg.match[1], msg.match[2] + (if msg.match[2].search(/\?$/)==(-1) then '?' else ''), (url) ->
      msg.send url

  robot.hear /(.*)(AND IT\'S GONE.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/src_images/uIZe3Q.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /WHAT IF I TOLD YOU (.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/src_images/fWle1w.png', 'WHAT IF I TOLD YOU', msg.match[1], (url) ->
      msg.send url

memeGenerator = (msg, imageName, text1, text2, callback) ->
  imageUrl = imageName

  processResult = (err, res, body) ->
    return msg.send err if err
    if res.statusCode == 301
      msg.http(res.headers.location).get() processResult
      return
    if res.statusCode > 300
      msg.reply "Sorry Senpai, I couldn't generate that meme. There was an unexpected status from memecaption.com: #{res.statusCode}"
      return
    try
      result = JSON.parse(body)
    catch error
      msg.reply "Sorry Senpai, I couldn't make that meme. There was an unexpected response from memecaptain.com: #{body}"
    if result? and result['imageUrl']?
      callback result['imageUrl']
    else
      msg.reply "Sorry Senpai, I couldn't make a meme of what you said."

  msg.http("http://memecaptain.com/g")
  .query(
    u: imageUrl,
    t1: text1,
    t2: text2
  ).get() processResult
