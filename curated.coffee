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
website = "https://cdn.glitch.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2FfirstWebsiteCRT.svg?1492038242223"
facebook = "https://cdn.glitch.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2FfacebookThumb.png?1492531632789"
microsoft = "https://cdn.glitch.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2FmicrosoftLogo.png?1493296051489"
twilio = "https://cdn.glitch.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2Ftwilio.png?1493735308539"
wistia = "https://cdn.glitch.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2Fwistia.png?1493735308565"
slackAvatar = "https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Fslack.svg"
# slackCover = ""
superbowl = "https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2FbigGameLogo.png"

backgroundOpacity = 0.3

# luck-beam updates:
# - project 'name' to 'referenceName' (won't be printed on new community, instead will use api)
# - url won't be used, will also be fetched from db based on id
# - projects: removed likes, remixes, id
# - changed featured properties to match new project ones
# - removed projectAvatarNeedsBackground. model shouldn't contain styling cues. if the avatar image isn't legible, we'll make a better one
# - removed curated names for project (instead using domains only), using project names is more predictable and trains the user on how to name their own projects
# - ported over latest prod into this new model (on mar 7)
# - todo: moved partner collections into team profile pages beta (add a partners section to parse w project domains(/id?) array to api fetch against)
# - moved collections to its own seperate group
# - all categories always listed on homepage

module.exports =

  featured: -> [
      name: 'Find Tools for Social Progress'
      domain: 'tech-forward-2'
      id: '16d249c6-c928-4616-a548-3108bce18ead'
      img: "https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2FtechForwardFeatureAlt.png"
      users: [
          login: 'mattstauffer'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/151829?v=3&s=48'
      ]       
    ,
      name: 'Make Your Own Slack Bot'
      domain: 'slack-bot'
      id: '095a1538-8c44-4b27-b0fe-936d194318c2'
      img: "https://cdn.hyperdev.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Ffeatured-slack-bot.png"
      users: [
          login: 'garethx'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/1830035?v=3&s=48'
      ]   
    ,
      name: 'Teach Alexa New Skills'
      domain: 'alexa-skill'
      id: '681cc882-059d-4b05-a1f6-6cbc099cc79c'
      img: "https://cdn.hyperdev.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Ffeatured-alexa.png"
      users: [
          login: 'STRd6'
          avatarUrl: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
        ,
          login: 'pketh'
          avatarUrl: 'https://avatars2.githubusercontent.com/u/877072?v=3&s=48'    
      ]   
  ] 

  partners: -> [
      name: 'Slack'
      url: 'slack'
      avatarUrl: slackAvatar
      coverUrl: ""
      description: """
        Bots, slash commands and apps that you can remix to make everyone's favorite team messaging tool even more useful, personalized and fun • See what https://slack.com/is
      """ # live parse links
      # website: ""
      # blog: "https://medium.com/slack-developer-blog"
      # docs: ""
      # github: ""
      # twitter: ""
      # background: "rgba(252, 243, 174, #{backgroundOpacity})"
      # color: "#FCF3AF"
      # id: 9
      id: 1
    # ,
    # projects reference with 'partnerIds'
  ]

  # TODO work w gareth to design/make a collection page. distinct from category page.
  # more like a blog post with interstitial photos and descriptions?
  # ex 'black history month' collection
  # a more guided path from intro, tutorials, to building blocks?
  # https://docs.google.com/document/d/1G58e3FqUXqaXPRKwG5Y9w3hw5gbLrIc2p90mX5S-3hk/edit#
  # /collection/big-game urls?
  collections: -> [
      name: 'Big Game Apps'
      url: 'big-game'
      img: superbowl
      color: "#FCF3AF"
      description: "From gridiron to your editor, create apps for the big game."
      background: "rgba(252, 243, 174, #{backgroundOpacity})"
      id: 1 # projects reference with 'collectionIds'
  ]

  categories: -> [
      name: 'Hello Worlds'
      url: 'hello-worlds'
      img: computer
      color: "#FCF3AF"
      description: "Experiment with technologies and libraries by remixing these sample projects."
      background: "rgba(252, 243, 174, #{backgroundOpacity})"
      id: 1
    ,
      name: 'Games'
      url: 'games'
      img: tetris
      color: "#FBA058"
      description: "Make your own cool games. Get that idea out of your head and into the world."
      background: "rgba(251, 159, 88, #{backgroundOpacity})"
      id: 2
    ,
      name: 'Building Blocks'
      url: 'building-blocks'
      img: shapes
      color: "#31cdd4"
      description: "Databases, emailing and more. The bread and butter basics of modern web dev."
      background: "rgba(49, 204, 212, #{backgroundOpacity})"
      id: 3
    ,
      name: 'Learn to Code'
      url: 'learn-to-code'
      img: education
      color: "#FFD1C6"
      description: "Learn by doing, then breaking, then doing some more. You got this!"
      background: "rgba(255, 209, 198, #{backgroundOpacity})"
      id: 4
    ,
      name: 'Tools for Work'
      url: 'tools-for-work'
      img: coffee
      color: "#70a4d8"
      description: "Every business is a snowflake. Build and customize your own tools and integrations."
      background: "rgba(112, 164, 216, #{backgroundOpacity})"
      id: 5
    ,
      name: 'Community Picks'
      url: 'community-picks'
      img: diamond
      color: "#9DE0FC"
      description: "Community submissions that do the flyest things ✨"
      background: "rgba(156, 224, 252, #{backgroundOpacity})"
      id: 6
    ,
      name: 'Handy Bots'
      url: 'handy-bots'
      img: robot
      color: "#C9BFF4"
      description: "Build helpful tools, meme generators, or Westworld. Your bots have your back."
      background: "rgba(201, 191, 244, #{backgroundOpacity})"
      id: 7
    ,
      name: 'Hardware'
      url: 'hardware'
      img: hardware
      color: "rgb(48, 220, 166)"
      description: "Connect your gadgets and gizmos to the world – or your kitchen."
      background: "rgba(48, 220, 166, #{backgroundOpacity})"
      id: 8
    ,
      name: 'First Websites'
      url: 'websites'
      img: website
      color: 'rgb(255, 120, 100)'
      description: "A look back at the sites where many people created their first web pages."
      background: "rgba(255, 120, 100, #{backgroundOpacity})"
      id: 9
      categoryPageOnly: true
    ,
      name: 'Facebook'
      url: 'facebook'
      img: facebook
      color: '#70a4d8'
      description: "Kickstart creation of your own apps using Facebook developer APIs."
      background: "rgba(112, 164, 216, #{backgroundOpacity})"
      id: 10
      categoryPageOnly: true
    ,
      name: 'Microsoft'
      url: 'microsoft'
      img: microsoft
      color: '#70a4d8'
      description: "Leverage Microsoft APIs, SDKs and open source projects to make your own apps."
      background: "rgba(112, 164, 216, #{backgroundOpacity})"
      id: 11
      categoryPageOnly: true  
    ,
      name: 'Twilio'
      url: 'twilio'
      img: twilio
      color: 'rgb(255, 120, 100)'
      description: "Build apps that communicate with everyone in the world using Twilio's Voice & Video, Messaging, and Auth APIs."
      background: "rgba(255, 120, 100, #{backgroundOpacity})"
      id: 12
      categoryPageOnly: true
    ,
      name: 'Wistia'
      url: 'wistia'
      img: wistia
      color: '#70a4d8'
      description: "Wistia's APIs allow you to easily upload, embed, and track videos within your own apps."
      background: "rgba(112, 164, 216, #{backgroundOpacity})"
      id: 13
      categoryPageOnly: true    
  ]

  projects: -> [
      id: '56b6e738-2249-4332-9b49-8d0efe03aad3'
      domain: 'memory-game'
      description: 'Memory matching game with different themes for cards'
      users: [
        login: 'etamponi'
        avatarUrl: 'https://avatars3.githubusercontent.com/u/578612?v=3&s=48'
      ]
      categoryIds: [2]
    ,
      id: '824edd48-c9bd-4aee-a3fb-561bb97344ed'
      domain: 'data-dashboard'
      description: "Display data from Google Sheets on a live dashboard"
      categoryIds: [5]
    ,
      id: 'd5323c5b-d1fd-4d39-97ac-c5d8b4cfd3f8'
      domain: 'socketio-chat'
      description: "A simple chat demo using Socket.io"
      categoryIds: [3]
    ,
      id: '13e7a934-0610-41e9-aa64-f71b0d6c0885'
      domain: 'mini-compiler'
      description: "Learn how compilers work - create a Lua to Assembly compiler in JavaScript"
      users: [
        login: 'InPermutation'
        avatarUrl: 'https://avatars0.githubusercontent.com/u/1096993?v=3&s=48'
      ]
      categoryIds: [4]
    ,
      id: '5e32909a-54f2-43d3-acad-465ff145a3c7'
      domain: 'nodemailer'
      description: "Email sending form with React and Nodemailer"
      categoryIds: [3]
    ,
      id: '546c8e41-ca39-481c-837f-ea830661c315'
      domain: 'rest-api'
      description: "GET and POST RESTful API endpoints using Express"
      categoryIds: [3]
    ,
      id: '0d184ee3-fd8d-4b94-acf4-b4e686e57375'
      domain: 'passport-js'
      description: "User authentication using Passport.js and OAuth providers"
      categoryIds: [1]
    ,
      id: 'c16a0c85-5369-42c2-9f2f-9144d02c5c93'
      domain: 'backbone-todomvc'
      description: "A To-do list app using Backbone.js (TodoMVC)"
      categoryIds: [1]
    ,
      id: '6c151b93-db34-4be3-b55b-cfc801610685'
      domain: 'mocha-chai'
      description: "Adding tests before deploy with Mocha and Chai"
      users: [
          login: 'etamponi'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/578612?v=3&s=48'
      ]
      categoryIds: [1]
    ,
      id: 'a03e4c57-8a6e-440c-8485-faed8c5c885c'
      domain: 'server-side-d3js'
      description: "Rendering SVG charts on the server-side with D3.js"
      categoryIds: [1]
    ,
      id: '99749cb1-1e95-402e-8343-354250b61a17'
      domain: 'browserify-middleware'
      description: "Basic Browserify Middleware Hello World example"
      users: [
          login: 'STRd6'
          avatarUrl: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
      ]
      categoryIds: [1]
    ,
      id: 'c9bd27a5-9cbc-4592-8189-45847dfabcdb'
      domain: 'twilio-sms'
      description: "Use Twilio to send SMS alerts on page error"
      categoryIds: [3,8]
    ,
      id: '4032b241-bff8-473e-aa6b-eb0c92a4bd06'
      domain: 'twitterbot'
      description: "A template for making fun Twitter bots with the Twit Node.js library"
      users: [
          login: 'fourtonfish'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/3909390?v=3&s=48'
      ]
      categoryIds: [7]
    ,
      id: '38ccccbc-8fb1-4ae5-bf06-b8d67b7dfb6a'
      domain: 'slack-bot-persist'
      description: "Onboarding bot using Slack's Events API, with MongoDB for persistence"
      categoryIds: [7]
      parnterIds: [9]
    ,
      id: '19d39bfe-9d27-4cbb-8326-ad41d1cc61bc'
      domain: 'to-do'
      description: "A simple, minimalist Todo app"
      users: [
          login: 'enriquesanchez'
          avatarUrl: 'https://avatars2.githubusercontent.com/u/3276087?v=3&s=48'
      ]
      categoryIds: [5]
    ,
      id: '63f7213c-91c1-4720-a47f-7a384e830aa9'
      domain: 'scrape-it'
      description: "Web scraper using scrape-it"
      categoryIds: [3]
    ,
      id: 'c2043750-bda2-4652-9278-15d221f12345'
      domain: 'asl-spell'
      description: "Practice the ASL fingerspelled alphabet"
      users: [
          login: 'jude'
          avatarUrl: 'https://pbs.twimg.com/profile_images/627115681201430528/0rE2ZRqj.jpg'
      ]
      categoryIds: [6]
    ,
      id: '9d603f59-e7f6-4f63-8bd9-d55770bc8e0d'
      domain: 'tetrjs'
      description: "A Tetris clone in JavaScript"
      users: [
          login: 'jennazee'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/1097241?v=3&s=48'
      ]
      categoryIds: [2]
    ,
      id: 'a24de56a-9f77-4503-be6f-730bcd4094f3'
      domain: 'excel-spreadsheet'
      description: "Read and display data from a .xlsx file on Dropbox"
      users: [
          login: 'jude'
          avatarUrl: 'https://pbs.twimg.com/profile_images/627115681201430528/0rE2ZRqj.jpg'
      ]
      categoryIds: [5,11]
    ,
      id: '54b2142c-d885-42da-86ba-22213877039b'
      domain: 'trello-shopping-list'
      description: "Auto-generate a shopping list from Trello recipe checklists"
      users: [
          login: 'LouManglass'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/241059?v=3&s=48'
      ]
      categoryIds: [6]
    ,
      id: 'a7b7d5c3-b931-4ce0-a746-fe06ed8da62a'
      domain: 'frogfeels'
      description: 'Draw some feelings, see what everyone else drew weekly'
      users: [
          login: 'pketh'
          avatarUrl: 'https://avatars2.githubusercontent.com/u/877072?v=3&s=48'
      ]
      categoryIds: [6]
    ,
      id: '1c04125e-84eb-4ab4-b5db-347ad757f4eb'
      domain: 'node-sass'
      description: "Demo project showing how to use Sass middleware"
      users: [
          login: 'STRd6'
          avatarUrl: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
      ]
      categoryIds: [1]
    ,
      id: 'c4f87dae-fa3a-437e-9e13-fa79e98e3952'
      domain: 'font-awesome-export'
      description: "Creates the mouse cursor and image code for Font Awesome icons"
      users: [
          login: 'olragon'
          avatarUrl: 'https://avatars2.githubusercontent.com/u/47636?v=3&s=48'
      ]
      categoryIds: [6]
    ,
      id: '008c399a-3f86-45ad-8131-df3a14b0e7ed'
      domain: 'processing-js'
      description: "A hypnotic processing.js sketch"
      users: [
          login: 'JosephLaurino'
          avatarUrl: 'https://avatars2.githubusercontent.com/u/755681?v=3&s=48'
      ]
      categoryIds: [1]
    ,
      id: '41d23949-7ea8-4e05-8724-21a78a4b9243'
      domain: 'trello-webhooks'
      description: "Lists Trello board activity via webhooks"
      categoryIds: [5]
    ,
      id: '3af10551-a9bb-47e1-83a3-958a8bd45860'
      domain: 'freelancer-theme'
      description: "A one page Bootstrap website theme for freelancers"
      users: [
          login: 'davidtmiller'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/8400627?v=3&s=48'
      ]
      categoryIds: [4]
    ,
      id: 'ab2a48b3-b6e1-4883-a4ea-045dfb87cdc8'
      domain: 'creative-theme'
      description: "A one page Bootstrap website theme for portfolios and businesses"
      users: [
          login: 'davidtmiller'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/8400627?v=3&s=48'
      ]
      categoryIds: [4]
    ,
      id: 'fd904fcf-ea8b-415b-ac02-d873c2fd0803'
      domain: 'beginner-javascript'
      description: "Learn the basics of HTML, JavaScript, triggering actions and using jQuery"
      categoryIds: [4]
    ,
      id: 'fc07966b-c035-4ff2-82e9-75548756a8e3'
      domain: 'intermediate-javascript'
      description: "Learn about logging, listening, variables, conditionals, arrays & functions"
      categoryIds: [4]
    ,
      id: 'a9e55c25-bf40-4162-b1b5-dc33047c0cdc'
      domain: 'slack-slash-command'
      description: "Respond to custom Slash Commands in Slack, using MongoDB for persistence"
      categoryIds: [7]
      parnterIds: [9]
    ,
      id: '0bbef086-c8da-44c3-a854-c1ea07b9347f'
      domain: 'circles-bouncing-off-lines'
      description: "Learn how to calculate the movement of circles as they bounce off lines"
      users: [
        login: 'maryrosecook'
        avatarUrl: 'https://avatars3.githubusercontent.com/u/2716?v=3&s=48'
      ]
      categoryIds: [4]
    ,
      id: '52926f2f-6fd3-428c-8846-a2b02b4d20d3'
      domain: 'auth0'
      description: "Let Auth0 take care of how users authenticate with your app"
      categoryIds: [3]
    ,
      id: '681cc882-059d-4b05-a1f6-6cbc099cc79c'
      domain: 'alexa-skill'
      description: "Ask Alexa for airport information using an airport code"
      categoryIds: [7,8]
    ,
      id: 'ca73ace5-3fff-4b8f-81c5-c64452145271'
      domain: 'messenger-bot'
      description: "A Facebook Messenger Platform bot template"
      users: [
          login: 'fbsamples'
          avatarUrl: 'https://avatars1.githubusercontent.com/u/1541324?v=3&s=48'
      ]
      categoryIds: [7,10]
    ,
      id: '68ea9bee-f345-4677-a916-f7c67004ae2d'
      domain: 'grunt-js'
      description: "Example app that minifies a JS file with Uglify using Grunt"
      categoryIds: [1]
    ,
      id: 'bd480ea2-8578-4c05-8924-41328b922d16'
      domain: 'parse-server'
      description: "An example Parse Server project using Express"
      users: [
          login: 'AndrewLane'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/479232?v=3&s=48'
      ]
      categoryIds: [3]
    ,
      id: '7c96ce5b-c85b-41f9-b2fa-174f7d7475b8'
      domain: 'parse-dashboard'
      description: "A sample project implementing Parse Dashboard"
      users: [
          login: 'AndrewLane'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/479232?v=3&s=48'
      ]
      categoryIds: [5]
    ,
      id: '26e3250c-12a8-4f2b-b122-04b217da32cb'
      domain: 'parse-todo'
      description: "Example To-do app that uses Parse Server as a backend"
      categoryIds: [5]
    ,
      id: '519836db-41bb-43a8-b2d5-f6d9c55e314a'
      domain: 'node-twitter'
      description: "Full Twitter clone app using Express and MongoDB"
      users: [
          login: 'vinitkumar'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/537678?v=3&s=48'
      ]
      categoryIds: [6]
    ,
      id: 'fb2f9ebf-77b2-4f81-9f07-e5425f261f57'
      domain: 'firebase-quickstart'
      description: "A simple social blog app using Firebase"
      categoryIds: [3]
    ,
      id: 'a787ebb0-b8ea-4a1f-8b6e-20d72cc6018d'
      domain: 'slide-show'
      description: "Example presentation slide show using reveal.js"
      categoryIds: [5]
    ,
      id: '3549cd9d-7768-447e-9d74-fa70370d6a1f'
      domain: 'salesforce-quickstart'
      description: "Handles OAuth and commands using SOQL, Search and Chatter APIs"
      categoryIds: [5,3]
    ,
      id: '732e6975-8c3a-44eb-8ac4-7932fd25440d'
      domain: 'mongodb-sync'
      description: "A simple blog app using MongoDB database to store data"
      categoryIds: [3]
    ,
      id: '65100072-2918-465c-962a-65ccb765b6de'
      domain: 'mongodb-async'
      description: "A simple blog app using MongoDB database to store data"
      categoryIds: [3]
    ,
      id: '5dd56de5-79af-444e-a17e-bd60230962eb'
      domain: 'sqlite3-db'
      description: "List app that demos a SQLite3 database using the Sequelize ORM"
      categoryIds: [3]
    ,
      id: '6c89fbec-c325-4618-9221-8da91296c6bb'
      domain: 'node-beginner'
      description: "A beginner's guide to Node.js and JavaScript. Get started by selecting 'View Code'"
      users: [
        login: 'manuelkiessling'
        avatarUrl: 'https://avatars3.githubusercontent.com/u/206592?v=3&s=48'
      ]
      categoryIds: [4]
    ,
      id: 'd89cf37a-fef6-4855-b0dc-e029aa6c402f'
      domain: 'javascripting'
      description: "18 exercises, covering the basics of JavaScript from variables to functions"
      categoryIds: [4]
    ,
      id: '095a1538-8c44-4b27-b0fe-936d194318c2'
      domain: 'slack-bot'
      description: "Example Onboarding bot using Slack's Events API"
      categoryIds: [7]
      parnterIds: [9]
    ,
      id: 'ea79cf2c-9dce-4e84-ac29-3b6d1941c452'
      domain: 'add-to-alexa'
      description: "Generate an Alexa Flash Briefing compatible JSON feed from submitted articles"
      categoryIds: [7,8]
    ,
      id: 'feca3b9d-2ddb-43ff-98fa-57abfe77506b'
      domain: 'drawing-game'
      description: "Draw in real-time with multiple other people, and see what they're drawing too"
      categoryIds: [2]
    ,
      id: '58fe13bd-0688-49f3-b562-c3b5817fc5d6'
      domain: 'ne-db'
      description: "A list app that demos interacting with a NeDB database"
      categoryIds: [3]
    ,
      id: '2d2e28d2-e17b-4934-a643-b1c5ba787a0b'
      domain: 'nuxt-starter'
      description: "Editable live starter for nuxt.js"
      users: [
        login: 'nuxt'
        avatarUrl: 'https://avatars3.githubusercontent.com/u/23360933?v=3&s=48'
      ]
      categoryIds: [1]
    ,
      id: 'a5a7b583-22ce-4f4f-a597-b5ec6a97c1ed'
      domain: 'vue-hn'
      description: "Hacker News clone with server-side rendering, built w/ Vue 2.0, vue-router & vuex"
      users: [
        login: 'vuejs'
        avatarUrl: 'https://avatars3.githubusercontent.com/u/6128107?v=3&s=48'
      ]
      categoryIds: [6]
    ,
      id: '61b1736e-6fc1-47f5-addb-2a925099abc4'
      domain: 'vue-ssr'
      description: "Vue 2.0 Server-side Rendering using only ES5 with no build step"
      users: [
        login: 'vuejs'
        avatarUrl: 'https://avatars3.githubusercontent.com/u/6128107?v=3&s=48'
      ]
      categoryIds: [1]
    ,
      id: 'd5d11c11-c239-4b16-ae23-def8e2687c25'
      domain: 'fogbugz-webhooks'
      description: "A simple server that handles incoming Webhooks delivered from FogBugz"
      categoryIds: [5]
    ,
      id: '6ef506f0-b790-454b-a9b8-f31347cc69f3'
      domain: 'multiplayer-game'
      description: "Real-time multiplayer game using Node.js, Socket.io and HTML5 Canvas"
      users: [
        login: 'underscorediscovery'
        avatarUrl: 'https://avatars3.githubusercontent.com/u/236374?v=3&s=48'
      ]
      categoryIds: [2,3]
    ,
      id: 'b76e18c8-01d4-48ce-9516-af13503c2a53'
      domain: 'pixelatize'
      description: "Upload an image and '8-bit-ify' or pixelate or whatever you want to call it"
      users: [
        login: 'jennschiffer'
        avatarUrl: 'https://avatars3.githubusercontent.com/u/341305?v=3&s=48'
      ]
      categoryIds: [6]
    ,
      id: '57237357-0897-4eed-a5ec-b35c4432502c'
      domain: 'space-invaders'
      description: "Learn about the game loop, collisions, input, drawing and sounds"
      users: [
        login: 'maryrosecook'
        avatarUrl: 'https://avatars3.githubusercontent.com/u/2716?v=3&s=48'
      ]
      categoryIds: [2]
    ,
      id: '21ec6159-b62d-4397-9de2-4736d40aa18f'
      domain: 'voting'
      description: "A simple polling and voting app"
      users: [
          login: 'hsubox'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/470813?v=3&s=48'
      ]
      categoryIds: [5]
    ,
      id: '96ca67fd-d729-4a35-9edc-8ee01bdedb63'
      domain: 'mini-breakout'
      description: "A simple Phaser-based Breakout clone"
      users: [
          login: 'anildash'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/84376?v=3&s=48'
      ]
      categoryIds: [2]
    ,
      id: 'd76dfe3f-23bc-4a7e-9629-f110d2ffa268'
      domain: 'browser-quest'
      description: "A HTML5/JavaScript massively multiplayer online role-playing game"
      users: [
          login: 'glecollinet'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/364962?v=3&s=48'
        ,
          login: 'sork'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/184017?v=3&s=48'
      ]
      categoryIds: [2]
    ,
      id: '454c12bf-21a2-485d-ab64-975d05525c16'
      domain: 'nondescript-dog'
      description: "Play multiplayer Snake over websockets"
      users: [
          login: 'benoror'
          avatarUrl: 'https://avatars0.githubusercontent.com/u/119117?v=3&s=48'
      ]
      categoryIds: [2]
    ,
      id: '9fe017c4-756e-4c58-b10b-e5412e32aefb'
      domain: 'material-design'
      description: "A quick way to bootstrap a site or app with Material"
      users: [
          login: 'ghaida'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/342672?v=3&s=48'
      ]
      categoryIds: [3]
    ,
      id: '92d725da-5ec6-467d-959f-79cf20b8b93c'
      domain: 'coffee-talks'
      description: "Heartfelt dev talks for humans, using Airtable as the database"
      users: [
          login: 'rosamcgee'
          avatarUrl: 'https://avatars0.githubusercontent.com/u/2496274?v=3&s=48'
        ,
          login: 'pketh'
          avatarUrl: 'https://avatars2.githubusercontent.com/u/877072?v=3&s=48'
      ]
      categoryIds: [6]
    ,
      id: '12834ffd-d5ed-423a-b486-9f297f5cd04f'
      domain: 'botkit-slack'
      description: "Starter kit for creating a Botkit-powered Slack app"
      users: [
          login: 'howdyai'
          avatarUrl: 'https://avatars1.githubusercontent.com/u/16260958?v=3&s=48'
      ]
      categoryIds: [7]
      parnterIds: [9]
    ,
      id: '4761356a-9369-4e79-9d1e-a8306e8c00b5'
      domain: 'multi-ifttt-triggers'
      description: "Trigger multiple actions from a single command"
      categoryIds: [8]
    ,
      id: '0e1a6c28-f95f-4920-a691-27697b572b24'
      domain: 'conditional-ifttt-triggers'
      description: "Trigger one or more IFTTT services when certain conditions are met"
      categoryIds: [8]
    ,
      id: '1545abd9-68a2-4c4a-937b-8ee19ac2aa3e'
      domain: 'zapier-webhooks'
      description: "Send and receive webhooks to and from Zapier"
      categoryIds: [8,5]
    ,
      id: 'af1e91ec-2f6d-4a37-82cb-21c8bd289460'
      domain: 'google-home'
      description: "Which is better, Daddy or Chips? Your Google Home knows"
      categoryIds: [8,7]
    ,
      id: 'cfc5bdd8-35cf-4f95-9ea0-4d637739ac6d'
      domain: 'particle-api'
      description: "Control an LED on a Particle device using the Particle JS API"
      categoryIds: [8,3]
    ,
      id: '9f67720d-ad82-43b1-a7a5-2edc81e35b48'
      domain: 'littlebits-api'
      description: "Control your CloudBit device using the littleBits API"
      categoryIds: [8,3]
    ,
      id: 'cbd095f2-e0a5-4f7d-8113-2fc54d79b1ea'
      domain: 'temboo'
      description: "Temboo example app that uses their Node.js SDK"
      categoryIds: [8]
    ,
      id: '5d5360ae-ed85-4a92-b60e-421acb2da08a'
      domain: 'coffee-script-base'
      description: "CoffeeScript backend that compiles clientside code with CoffeeScript using Browserify middleware"
      users: [
          login: 'STRd6'
          avatarUrl: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
      ]
      categoryIds: [3]
    ,
      id: '55dbb2a4-94d9-434f-9dcc-1432c975de1c'
      domain: 'superbowl-squares'
      description: "Start your own Football Squares pool with friends and colleagues"
      collectionIds: [1]
    ,
      id: '902cbaf0-e4e9-47c0-80b2-fe7ef583d679'
      domain: 'big-game-bingo'
      description: "Watch the big game for the ads? Embrace the clichés and play Big Game Bingo!"
      collectionIds: [1]
    ,
      id: '56e665e5-e0a8-46c8-9476-8d9b731117dd'
      domain: 'quarterback-quiz'
      description: "Test your Football knowledge with this Quarterback quiz"
      collectionIds: [1]
    ,
      id: '514be323-4add-49c4-806d-e7f8fc27e933'
      domain: 'livechat-sample-agent-app'
      description: "Sample app demonstrating how to build a LiveChat App Extension"
      users: [
          login: 'livechat'
          avatarUrl: 'https://avatars2.githubusercontent.com/u/1615526?v=3&s=48'
      ]
      categoryIds: [3,5]
    ,
      id: '4a351a6e-f316-495c-b107-8b91ade9746e'
      domain: 'hackathon-starter'
      description: "A boilerplate for Node.js web applications"
      users: [
          login: 'sahat'
          avatarUrl: 'https://avatars2.githubusercontent.com/u/544954?v=3&s=48'
      ]
      categoryIds: [3]
    ,
      id: '16d249c6-c928-4616-a548-3108bce18ead'
      domain: 'tech-forward-2'
      description: "Find and share tools for social progress"
      users: [
          login: 'mattstauffer'
          avatarUrl: 'https://avatars2.githubusercontent.com/u/151829?v=3&s=48'
      ]
      categoryIds: [6]
    ,
      id: '9a2033a3-30d8-4658-93a8-3b5073c73237'
      domain: 'ghost'
      description: "Simple blogging platform, just remix to get started"
      users: [
          login: 'TryGhost'
          avatarUrl: 'https://avatars2.githubusercontent.com/u/2178663?v=3&s=48'
      ]
      categoryIds: [6]
    ,
      id: '9fcb4c92-412a-4570-bd9b-ca8fd060eb5b'
      domain: 'node-console'
      description: "Run console applications in your browser"
      users: [
          login: 'etamponi'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/578612?v=3&s=48'
      ]
      categoryIds: [1]
    ,
      id: 'd64593e9-4e16-4ee5-a47b-362b5bccf26a'
      domain: 'dropbox-auth'
      description: "Server-side authorization for Dropbox"
      users: [
          login: 'zxzxlch'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/243925?v=3&s=48'
      ]
      categoryIds: [3,5]
    ,
      id: '3ba301ab-0572-4077-9cb1-d37ef8b08786'
      domain: 'hyperapp'
      description: "Examples of HyperApp, a 1kb JavaScript library for modern UI apps"
      users: [
          login: 'hyperapp'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/25238911?v=3&s=48'
      ]
      categoryIds: [1]
    ,
      id: 'fee2c865-eccf-488f-a663-964082b34098'
      domain: 'html-starter'
      description: "Simple, modular HTML5 template to kick off your responsive websites"
      users: [
          login: 'zitrusfrisch'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/1192474?v=3&s=48'
      ]
      categoryIds: [3,4,9]
    ,
      id: 'c39d16ef-bc2e-44ae-8df5-4293b248b243'
      domain: 'html-5-boilerplate'
      description: "Simple, modular HTML5 template to kick off your responsive websites"
      users: [
          login: 'h5bp'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/1136800?v=3&s=48'
      ]
      categoryIds: [1,3]
    ,
      id: 'c4360738-dae3-4b12-ba51-03f5944f3b0f'
      domain: 'bower-grunt'
      description: "Find the installed components and inject them into HTML files"
      categoryIds: [1]
    ,
      id: 'daa2ecb6-69b3-4415-8499-0756261584d5'
      domain: 'setup-wizard'
      description: "Display a setup wizard for users to configure environment variables when remixing your app"
      users: [
          login: 'etamponi'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/578612?v=3&s=48'
      ]
      categoryIds: [3]
    ,
      id: '06290abf-71bb-4336-9447-5364c4b2b6d6'
      domain: 'twitter-passport-example'
      description: "Easily use Twitter for authentication in your app"
      categoryIds: [3]
    ,
      id: '9d99c4fd-2153-4d0e-b9a7-dcb9b46c9028'
      domain: 'dojo-bigscreen'
      description: "A big screen dashboard for your business using Trello, Weather Underground and StatusCake examples"
      users: [
          login: 'danroot'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/2205215?v=3&s=48'
      ]    
      categoryIds: [6]
    ,
      id: '7bb031da-8422-40b7-b9fb-bab494908c5d'
      domain: 'bitlytics'
      description: "View click stats for all tweets by a user that contain a bit.ly link"
      users: [
          login: 'garethx'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/1830035?v=3&s=48'
      ]
    ,
      id: 'c6612fcf-459b-45b3-8ea7-7e1088946a24'
      domain: 'choo-todo'
      description: 'An implementation of a TodoMVC-like app using the new v5 Choo API'
      users: [
        login: 'byronhulcher'
        avatarUrl: 'https://avatars0.githubusercontent.com/u/2479295?v=3'
      ]
      categoryIds: [1]
    ,
      id: 'c8ac88a4-215c-4064-84c4-946e96b63ace'
      domain: 'aframe'
      description: 'A web framework for building VR experiences. Make WebVR with HTML and Entity-Component'
      users: [
        login: 'ngokevin'
        avatarUrl: 'https://avatars1.githubusercontent.com/u/674727?v=3'
      ]
      categoryIds: [1]
    ,
      id: 'cb02d9ae-61ed-4053-b465-d6e2e9656ac3'
      domain: 'assets-lib'
      description: 'Use relative paths to serve your assets on Glitch'
      users: [
          login: 'etamponi'
          avatarUrl: 'https://avatars3.githubusercontent.com/u/578612?v=3'
      ]
      categoryIds: [1] 
    ,
      id: 'f2fa9e14-e052-49c3-8799-02229a096740'
      domain: 'guardian'
      description: 'A simple Guardian API client using server side rendering'
      users: [
        login: 'gidsg'
        avatarUrl: 'https://avatars1.githubusercontent.com/u/1764158?v=3'
      ]
      categoryIds: [6,1]
    ,
      id: '3d15e4dc-9789-49b3-b7aa-59462d9889fd'
      domain: '2factor-auth'
      description: 'Two-Factor Authentication (2FA) demo written in Node.js with Nexmo Verify API'
      users: [
        login: 'girliemac'
        avatarUrl: 'https://avatars1.githubusercontent.com/u/107763?v=3'
      ]
      categoryIds: [1,3]
    ,
      id: 'ccd1f0e0-94cd-4ec4-8d37-9c31ac9edc24'
      domain: 'offline-with-serviceworker'
      description: 'Make your application load instantly & work offline with ServiceWorker'
      users: [
        login: 'kosamari'
        avatarUrl: 'https://avatars1.githubusercontent.com/u/4581495?v=3'
      ]
      categoryIds: [1,3]
    ,
      id: '206e612e-03aa-4908-b00d-12251a365b8d'
      domain: 'glitchable-type'
      description: 'It\'s just like your first blog, without the CGI-BIN'
      categoryIds: [9]
    ,
      id: '2288e05f-9a49-470f-b907-22494e69cce1'
      domain: 'glitchocities'
      description: 'Today\'s cool Homestead'
      categoryIds: [9]
    ,
      id: '8a04125b-a4b0-463c-a804-e333c4851040'
      domain: 'neopets'
      description: 'This is the place to see all the Glitchopets you own'
      categoryIds: [9]
    ,
      id: 'bc3e04b5-4113-469c-81c5-e2ca1334b0a8'
      domain: 'glitchspace'
      description: 'GlitchSpace, it\'s kind of a Place for Friends!'
      categoryIds: [9]
    ,
      id: 'd6f7f0c0-b2cf-4339-8249-d09d3db2cfa1'
      domain: 'wordpress'
      description: 'Forgive me father for I have blogged'
      categoryIds: [9]
     ,
      id: 'de2514f1-269d-4043-b358-1be3612d4686'
      domain: 'livejournal'
      description: 'For the Emo kid inside all of us'
      categoryIds: [9]     
     ,
      id: '371baed9-806f-4257-9b99-f0918b08c5df'
      domain: 'the-first-website'
      description: 'Where it all began'
      categoryIds: [9]
     ,
      id: '1511c567-bd2e-4467-9bb9-9241a34ca5e8'
      domain: 'retro-bootstrap'
      description: 'A vintage Bootstrap 1.4.0 example template to tinker with'
      categoryIds: [9] 
     ,
      id: 'e356b09a-8971-43d2-b7b4-f1390422e6f1'
      domain: 'graph-api-webhooks'
      description: 'A sample client for Facebook\'s Graph API Webhooks'
      users: [
          login: 'fbsamples'
          avatarUrl: 'https://avatars1.githubusercontent.com/u/1541324?v=3&s=48'
      ]    
      categoryIds: [10]
     ,
      id: '4c08ac56-7e55-424e-9134-744a82fd8ee0'
      domain: 'account-kit'
      description: 'Add user auth with Account Kit'
      users: [
          login: 'tpai'
          avatarUrl: 'https://avatars2.githubusercontent.com/u/579145?v=3&s=48'
      ]      
      categoryIds: [10]
     ,
      id: 'f83e1ac8-b75f-45e2-9ce3-4cf0dfc7656e'
      domain: 'fb-live-teleprompter'
      description: 'Live comments teleprompter'
      users: [
          login: 'fbsamples'
          avatarUrl: 'https://avatars1.githubusercontent.com/u/1541324?v=3&s=48'
      ]    
      categoryIds: [10]
     ,
      id: 'a665875d-1aa9-4122-8ea1-4513c66da156'
      domain: 'botkit-facebook'
      description: 'Build a Facebook Messenger bot with Botkit and Botkit Studio'
      users: [
          login: 'howdyai'
          avatarUrl: 'https://avatars1.githubusercontent.com/u/16260958?v=3&s=48'
      ]    
      categoryIds: [10]
     ,
      id: 'c942fe52-dcbc-43fc-ac80-5a66e388221a'
      domain: 'bot-builder-skype'
      description: 'An example Skype bot using Microsoft\'s Bot Builder SDK'    
      categoryIds: [7,11] 
     ,
      id: 'c439638e-7365-4b17-98d2-0913fa44d81e'
      domain: 'graph-connect'
      description: 'A Microsoft Graph Connect sample project'    
      categoryIds: [5,11]
     ,
      id: '8c68dea8-16a3-4e0d-8755-c9229208b84f'
      domain: 'azure-storage'
      description: 'Microsoft Azure Storage database list app'    
      categoryIds: [5,11]   
     ,
      id: 'd03b8eaf-e8d5-4038-8cdd-96f88673cac8'
      domain: 'tracery-mastodon-bot'
      description: 'A starter Mastodon bot that generates random toots using Tracery'  
      users: [
          login: 'byronhulcher'
          avatarUrl: 'https://avatars1.githubusercontent.com/u/2479295?v=3&s=48'
      ]     
      categoryIds: [7] 
     ,
      id: '0ddc2423-29f6-4e89-9d9f-8e911e949c15'
      domain: 'pass-azure'
      description: 'An example app implementing Azure OAuth with Passport.js'    
      categoryIds: [5,11] 
     ,
      id: 'fd94eac0-7f39-48d7-85d4-87ae0d46b36a'
      domain: 'wistia-webhooks-example'
      description: 'Use Webhooks to hear about stuff when it happens in Wistia'  
      users: [
          login: 'mrdavidjcole'
          avatarUrl: 'https://avatars1.githubusercontent.com/u/752729?v=3&s=48'
      ]     
      categoryIds: [13] 
     ,
      id: 'f6a79bb0-b834-4b0f-9d4f-5dbf068499bd'
      domain: 'wistia-chapter-links'
      description: 'Deeplink into a specific chapter within an embedded Wistia video'  
      users: [
          login: 'mrdavidjcole'
          avatarUrl: 'https://avatars1.githubusercontent.com/u/752729?v=3&s=48'
      ]     
      categoryIds: [13]  
     ,
      id: 'c9bd27a5-9cbc-4592-8189-45847dfabcdb'
      domain: 'twilio-sms'
      description: 'Send SMS messages with Twilio'      
      categoryIds: [12] 
     ,
      id: 'c7f4cd78-a43d-4129-b3f0-b53d3a9790a4'
      domain: 'twilio-chat-demo-js'
      description: 'IP Messaging API Demo Application for JavaScript'  
      users: [
          login: 'jennschiffer'
          avatarUrl: 'https://avatars1.githubusercontent.com/u/341305?v=3&s=48'
      ]     
      categoryIds: [12]
     ,
      id: 'faf46029-79ef-4175-977c-b23659e7dd33'
      domain: 'donejs-helloworld'
      description: 'A DoneJS, done-serve and done-autorender starter project'  
      users: [
          login: 'chasenlehara'
          avatarUrl: 'https://avatars1.githubusercontent.com/u/10070176?v=3&s=48'
      ,
          login: 'bmomberger-bitovi'
          avatarUrl: 'https://avatars1.githubusercontent.com/u/18686722?v=3&s=48'
      ]     
      categoryIds: [1]   
     ,
      id: 'e7c41525-7315-4218-9002-918ef887aa1c'
      domain: 'webpack-lazy-loading'
      description: 'Demos Webpack by lazy loading a module on demand'  
      users: [
          login: 'TheLarkInn'
          avatarUrl: 'https://avatars1.githubusercontent.com/u/3408176?v=3&s=48'
      ]     
      categoryIds: [1] 
     ,
      id: '9626bd34-22d2-4fe2-89ba-067450afc7f0'
      domain: 'create-react-app-sample'
      description: 'Create React apps with no build configuration'  
      users: [
          login: 'etamponi'
          avatarUrl: 'https://avatars1.githubusercontent.com/u/578612?v=3&s=48'
      ]     
      categoryIds: [1]     
  ]
