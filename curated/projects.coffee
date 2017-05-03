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

  # collections
  "websites"         : require "./collections/websites"
