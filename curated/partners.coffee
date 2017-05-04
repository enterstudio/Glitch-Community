# partner project pages
facebook = "https://cdn.glitch.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2FfacebookThumb.png?1492531632789"
microsoft = "https://cdn.glitch.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2FmicrosoftLogo.png?1493296051489"
twilio = "https://cdn.glitch.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2Ftwilio.png?1493735308539"
wistia = "https://cdn.glitch.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2Fwistia.png?1493735308565"

backgroundOpacity = 0.3

# note: a project object's curatedName is the file name within the ./curated/partners directory where
# the partners' projects exist. if you change the curatedName the file name must also change and vice versa

module.exports = 
  [
      name: 'Facebook'
      url: 'facebook'
      curatedName: 'facebook'
      img: facebook
      color: '#70a4d8'
      description: "Kickstart creation of your own apps using Facebook developer APIs."
      background: "rgba(112, 164, 216, #{backgroundOpacity})"
    ,
      name: 'Microsoft'
      url: 'microsoft'
      curatedName: 'microsoft',
      img: microsoft
      color: '#70a4d8'
      description: "Leverage Microsoft APIs, SDKs and open source projects to make your own apps."
      background: "rgba(112, 164, 216, #{backgroundOpacity})"
    ,
      name: 'Twilio'
      url: 'twilio'
      curatedName: 'twilio',
      img: twilio
      color: 'rgb(255, 120, 100)'
      description: "Build apps that communicate with everyone in the world using Twilio's Voice & Video, Messaging, and Auth APIs."
      background: "rgba(255, 120, 100, #{backgroundOpacity})"
    ,
      name: 'Wistia'
      url: 'wistia'
      curatedName: 'wistia',
      img: wistia
      color: '#70a4d8'
      description: "Wistia's APIs allow you to easily upload, embed, and track videos within your own apps."
      background: "rgba(112, 164, 216, #{backgroundOpacity})"
  ]