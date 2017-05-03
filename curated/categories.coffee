# project categories

computer = "https://cdn.hyperdev.com/us-east-1%3Acba180f4-ee65-4dfc-8dd5-f143280d3c10%2Fcomputer.svg"
recordPlayer = 'https://cdn.hyperdev.com/us-east-1%3Acba180f4-ee65-4dfc-8dd5-f143280d3c10%2Frecord-player.svg'
diamond = "https://cdn.hyperdev.com/us-east-1%3Acba180f4-ee65-4dfc-8dd5-f143280d3c10%2Fdiamond.svg"
clock = "https://cdn.hyperdev.com/us-east-1%3Acba180f4-ee65-4dfc-8dd5-f143280d3c10%2Fclock.svg"
education = "https://cdn.hyperdev.com/us-east-1%3Acba180f4-ee65-4dfc-8dd5-f143280d3c10%2Feducation.svg"
coffee = "https://cdn.hyperdev.com/0a15009e-17ee-4915-bc29-5ba03bb09517%2Fcoffee.svg"
shapes = "https://cdn.hyperdev.com/0a15009e-17ee-4915-bc29-5ba03bb09517%2Fshapes.svg"
tetris = "https://cdn.hyperdev.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Ftetris.svg"
robot = "https://cdn.hyperdev.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Frobot.svg"
hardware = "https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Fhardware.svg"

backgroundOpacity = 0.3

# note: a project object's curatedName is the file name within the ./curated/projects directory where
# the categories' projects exist. if you change the curatedName the file name must also change and vice versa

module.exports = 
  [
      name: 'Hello Worlds'
      url: 'hello-worlds'
      curatedName: 'hello-worlds'
      img: computer
      color: "#FCF3AF"
      description: "Experiment with technologies and libraries by remixing these sample projects."
      background: "rgba(252, 243, 174, #{backgroundOpacity})"
    ,
      name: 'Games'
      url: 'games'
      curatedName: 'games'
      img: tetris
      color: "#FBA058"
      description: "Make your own cool games. Get that idea out of your head and into the world."
      background: "rgba(251, 159, 88, #{backgroundOpacity})"
    ,
      name: 'Building Blocks'
      url: 'building-blocks'
      curatedName: 'building-blocks'
      img: shapes
      color: "#31cdd4"
      description: "Databases, emailing and more. The bread and butter basics of modern web dev."
      background: "rgba(49, 204, 212, #{backgroundOpacity})"
    ,
      name: 'Learn to Code'
      url: 'learn-to-code'
      curatedName: 'learn-to-code'
      img: education
      color: "#FFD1C6"
      description: "Learn by doing, then breaking, then doing some more. You got this!"
      background: "rgba(255, 209, 198, #{backgroundOpacity})"
    ,
      name: 'Tools for Work'
      url: 'tools-for-work'
      curatedName: 'tools-for-work'
      img: coffee
      color: "#70a4d8"
      description: "Every business is a snowflake. Build and customize your own tools and integrations."
      background: "rgba(112, 164, 216, #{backgroundOpacity})"
    ,
      name: 'Community Picks'
      url: 'community-picks'
      curatedName: 'community-picks'
      img: diamond
      color: "#9DE0FC"
      description: "Community submissions that do the flyest things ✨"
      background: "rgba(156, 224, 252, #{backgroundOpacity})"
    ,
      name: 'Handy Bots'
      url: 'handy-bots'
      curatedName: 'handy-bots'
      img: robot
      color: "#C9BFF4"
      description: "Build helpful tools, meme generators, or Westworld. Your bots have your back."
      background: "rgba(201, 191, 244, #{backgroundOpacity})"
    ,
      name: 'Hardware'
      url: 'hardware'
      curatedName: 'hardware'
      img: hardware
      color: "rgb(48, 220, 166)"
      description: "Connect your gadgets and gizmos to the world – or your kitchen."
      background: "rgba(48, 220, 166, #{backgroundOpacity})"
    ,
  ]