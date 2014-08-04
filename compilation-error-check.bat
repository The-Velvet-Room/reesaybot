setx HUBOT_IRC_SERVER "irc.twitch.tv"
setx HUBOT_IRC_ROOMS "#reesaybot"
setx HUBOT_IRC_NICK "reesaybot"
setx HUBOT_IRC_UNFLOOD "3000"
setx HUBOT_IRC_PASSWORD "oauth:432einosrtnrs90t9324523rsmten234ienrs0t934n092345nh3409nsrten234-324u23"
xcopy "scripts\*" "node_modules\hubot\src\scripts\" /E /C /H /R /K /O /Y

./bin/hubot -a irc
