# Description: 
#   Generates help commands for Hubot.
#
# Commands:
#   RESPOND hubot help - Displays all of the help commands that Hubot knows about.
#   RESPOND hubot help <query> - Displays all help commands that match <query>.
#
# URLS:
#   /hubot/help
#
# Notes:
#   These commands are grabbed from comment blocks at the top of each file.

helpContents = (name, commands) ->

  """
<html>
  <head>
  <title>ReesayBot Commands</title>
  <style type="text/css">
    body {
      background: #d3d6d9;
      color: #636c75;
      text-shadow: 0 1px 1px rgba(255, 255, 255, .5);
      font-family: Helvetica, Arial, sans-serif;
    }
    h1 {
      margin: 8px 0;
      padding: 0;
    }
    .commands {
      font-size: 13px;
    }
    p {
      border-bottom: 1px solid #eee;
      margin: 6px 0 0 0;
      padding-bottom: 5px;
    }
    p:last-child {
      border: 0;
    }
  </style>
  </head>
  <body>
    <center><h1>ReesayBot Commands</h1></center>
    <center><img src="https://camo.githubusercontent.com/fc6998de886de1ffb8e334a0319d8417bb9118e1/687474703a2f2f736567612d616464696374732e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031342f30342f32303134303431362d3139353930395f323130353132382d726973655f6b756a696b6177612e6a7067" height=144 width=256 alt="Rise Kujikawa"></center>
    <div class="commands">
      #{commands}
    </div>
  </body>
</html>
  """

module.exports = (robot) ->
  robot.respond /help\s*(.*)?$/i, (msg) ->
    msg.send("Try saying <commands> instead.")

  robot.router.get '/', (req, res) ->
    cmds = robot.helpCommands()
    emit = "<p>#{cmds.join '</p><p>'}</p>"

    emit = emit.replace /hubot/ig, "<b>#{robot.name}</b>"

    res.setHeader 'content-type', 'text/html'
    res.end helpContents robot.name, emit
