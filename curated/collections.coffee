# project collections

website = "https://cdn.glitch.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2FfirstWebsiteCRT.svg?1492038242223"
superbowl = "https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2FbigGameLogo.png"
art = "https://cdn.glitch.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2Fart.svg?1498839437796"
music = "https://cdn.glitch.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2Fmusic.svg?1499155427323"

backgroundOpacity = 0.3

# note: a project object's curatedName is the file name within the ./curated/collections directory where
# the collections' projects exist. if you change the curatedName the file name must also change and vice versa

module.exports = 
  [
      name: 'Big Game Apps'
      url: 'big-game'
      curatedName: 'big-game',
      img: superbowl
      color: "#F06449"
      description: "From gridiron to your editor, create apps for the big game."
      background: "rgba(240, 100, 73, #{backgroundOpacity})"
    ,    
      name: 'First Websites'
      url: 'websites'
      curatedName: 'websites'
      img: website
      color: 'rgb(255, 120, 100)'
      description: "A look back at the sites where many people created their first web pages."
      background: "rgba(255, 120, 100, #{backgroundOpacity})"
    ,
      name: 'Art'
      url: 'art'
      curatedName: 'art',
      img: art
      color: "#FFA3BB"
      description: "Windows to the weird, fun souls of talented artists, and the tools to create your own."
      background: "rgba(255, 164, 187, 0.5)"  
    ,
      name: 'Music'
      url: 'music'
      curatedName: 'music',
      img: music
      color: "#70A4D8"
      description: "The sounds of music created, connected, visualized and remixed, signifying everything."
      background: "rgba(162, 193, 255, 0.5)"      
  ]


