# all the projects!

# all the projects used to be listed here, with category ids to associate them with 
# categories listed in categories.coffee. now, they are split up into category files
# which are listed below

module.exports = 

  # core homepage categories
  "hello-worlds"     : require "./categories/hello-worlds"
  "games"            : require "./categories/games"
  "building-blocks"  : require "./categories/building-blocks"
  "learn-to-code"    : require "./categories/learn-to-code"
  "tools-for-work"   : require "./categories/tools-for-work"
  "community-picks"  : require "./categories/community-picks"
  "handy-bots"       : require "./categories/handy-bots"
  "hardware"         : require "./categories/hardware"
  
  # partners
  "facebook"         : require "./partners/facebook"
  "microsoft"        : require "./partners/microsoft"
  "twilio"           : require "./partners/twilio"
  "wistia"           : require "./partners/wistia"
  "google"           : require "./partners/google"  
  "slack"            : require "./partners/slack"  
  "signal"           : require "./partners/signal" 
  "slack-blueprints" : require "./partners/slack-blueprints"  
  "botkit"           : require "./partners/botkit"  
  "trello"           : require "./partners/trello"  
  "botwiki"           : require "./partners/botwiki"
  "twitter"           : require "./partners/twitter"   

  # collections
  "websites"         : require "./collections/websites"
  "big-game"         : require "./collections/superbowl"  
  "art"              : require "./collections/art" 
  "music"              : require "./collections/music"   
