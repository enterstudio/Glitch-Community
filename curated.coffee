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

slack = "https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Fslack.svg"
superbowl = "https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2FbigGameLogo.png"

backgroundOpacity = 0.3

# 🌱 See CURATORS.md for info on adding projects

# luck-beam updates: 
# - project 'name' to 'referenceName' (won't be printed on new community, instead will use api)
# - url won't be used, will also be fetched from db based on id
# - projects: removed likes, remixes, appId replaces projectId
# - changed featured properties to match new project ones
# - removed projectAvatarNeedsBackground. model shouldn't contain styling cues. if the avatar image isn't legible, we'll make a better one
# - removed curated names for project (instead using domains only), using project names is more predictable and trains the user on how to name their own projects

module.exports =

  featured: -> [
      name: 'Big Game Bingo'
      domain: 'big-game-bingo'
      projectId: '902cbaf0-e4e9-47c0-80b2-fe7ef583d679'
      img: "https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Ffeatured-big-game-advert-bingo.png"
      users: [
          name: 'STRd6'
          avatar: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
        ,
          name: 'pketh'
          avatar: 'https://avatars2.githubusercontent.com/u/877072?v=3&s=48'
      ]
    ,
      name: 'Quarterback Quiz'
      domain: 'quarterback-quiz'
      projectId: '56e665e5-e0a8-46c8-9476-8d9b731117dd'
      img: "https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Ffeatured-quarterback-quiz.png"
      users: [
          name: 'garethx'
          avatar: 'https://avatars3.githubusercontent.com/u/1830035?v=3&s=48'
      ]
    ,
      name: 'Super Bowl Squares'
      domain: 'superbowl-squares'
      projectId: '55dbb2a4-94d9-434f-9dcc-1432c975de1c'
      img: "https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Ffeatured-superbowl-squares.png"
      users: [
          name: 'etamponi'
          avatar: 'https://avatars3.githubusercontent.com/u/578612?v=3&s=48'
      ]
  ] 

  categories: -> [
      name: 'Hello Worlds'
      url: 'hello-worlds'
      img: computer
      color: "#FCF3AF"
      description: "Experiment with technologies and libraries by remixing these sample projects."
      background: "rgba(252, 243, 174, #{backgroundOpacity})"
      id: 1
      listedOnHomepage: true
    ,
      name: 'Games'
      url: 'games'
      img: tetris
      color: "#FBA058"
      description: "Make your own cool games. Get that idea out of your head and into the world."
      background: "rgba(251, 159, 88, #{backgroundOpacity})"
      id: 2
      listedOnHomepage: true      
    ,
      name: 'Building Blocks'
      url: 'building-blocks'
      img: shapes
      color: "#31cdd4"
      description: "Databases, emailing and more. The bread and butter basics of modern web dev."
      background: "rgba(49, 204, 212, #{backgroundOpacity})"
      id: 3
      listedOnHomepage: true      
    ,
      name: 'Learn to Code'
      url: 'learn-to-code'
      img: education
      color: "#FFD1C6"
      description: "Learn by doing, then breaking, then doing some more. You got this!"
      background: "rgba(255, 209, 198, #{backgroundOpacity})"
      id: 4
      listedOnHomepage: true      
    ,
      name: 'Tools for Work'
      url: 'tools-for-work'
      img: coffee
      color: "#70a4d8"
      description: "Every business is a snowflake. Build and customize your own tools and integrations."
      background: "rgba(112, 164, 216, #{backgroundOpacity})"
      id: 5
      listedOnHomepage: true      
    ,
      name: 'Community Picks'
      url: 'community-picks'
      img: diamond
      color: "#9DE0FC"
      description: "Community submissions that do the flyest things ✨"
      background: "rgba(156, 224, 252, #{backgroundOpacity})"
      id: 6
      listedOnHomepage: true      
    ,
      name: 'Handy Bots'
      url: 'handy-bots'
      img: robot
      color: "#C9BFF4"
      description: "Build helpful tools, meme generators, or Westworld. Your bots have your back."
      background: "rgba(201, 191, 244, #{backgroundOpacity})"
      id: 7
      listedOnHomepage: true      
    ,
      name: 'Hardware'
      url: 'hardware'
      img: hardware
      color: "rgb(48, 220, 166)"
      description: "Connect your gadgets and gizmos to the world – or your kitchen."
      background: "rgba(48, 220, 166, #{backgroundOpacity})"
      id: 8
      listedOnHomepage: true
    ,
      name: 'Slack Apps'
      url: 'slack'
      img: slack
      color: "#FCF3AF"
      description: "Bots, slash commands and apps that integrate with Slack."
      background: "rgba(252, 243, 174, #{backgroundOpacity})"
      id: 9
      partnerCollection: true
      partner: [
        homepage: ""
        blog: "https://medium.com/slack-developer-blog"
        docs: ""
        github: ""
        twitter: ""
      ]
    ,
      name: 'Big Game Apps'
      url: 'big-game'
      img: superbowl
      color: "#FCF3AF"
      description: "From gridiron to your editor, create apps for the big game."
      background: "rgba(252, 243, 174, #{backgroundOpacity})"
      id: 10
  ]

  projects: -> [
      projectId: '56b6e738-2249-4332-9b49-8d0efe03aad3'
      domain: 'memory-game'
      description: 'Memory matching game with different themes for cards'
      users: [
        name: 'etamponi'
        avatar: 'https://avatars3.githubusercontent.com/u/578612?v=3&s=48'
      ]
      categoryIds: [2]
    ,
      projectId: '1400a3bd-f901-4883-8394-a38eeac0d1f0'
      domain: 'space-program'
      description: "Launch your spaceship into orbit. Don't die."
      users: [
        name: 'InPermutation'
        avatar: 'https://avatars0.githubusercontent.com/u/1096993?v=3&s=48'
      ]
      categoryIds: [2]
    ,
      projectId: 'e1a17ca2-9167-4695-ba19-e0d5c34d09bb'
      domain: 'pong-solo'
      description: "Play Pong against a brick wall; now even harder to beat!"
      users: [
        name: 'STRd6'
        avatar: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
      ]
      categoryIds: [2]
    ,
      projectId: '397d14ff-0309-4411-895a-fda9e935c44b'
      domain: 'soundboard'
      description: 'Click pictures, listen to sounds, celebrate'
      users: [
          name: 'STRd6'
          avatar: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
        ,
          name: 'pketh'
          avatar: 'https://avatars2.githubusercontent.com/u/877072?v=3&s=48'
      ]
      categoryIds: [2]
    ,
      projectId: 'bb648dc0-74b3-4571-8840-6bf49cf84e66'
      domain: 'image-editor'
      description: "A thing for making SVG images. Draw with it."
      users: [
          name: 'InPermutation'
          avatar: 'https://avatars0.githubusercontent.com/u/1096993?v=3&s=48'
      ]
      categoryIds: [6]
    ,
      projectId: '824edd48-c9bd-4aee-a3fb-561bb97344ed'
      domain: 'data-dashboard'
      description: "Display data from Google Sheets on a live dashboard"
      categoryIds: [5]
    ,
      projectId: 'd5323c5b-d1fd-4d39-97ac-c5d8b4cfd3f8'
      domain: 'socketio-chat'
      description: "A simple chat demo using Socket.io"
      categoryIds: [3]
    ,
      projectId: '13e7a934-0610-41e9-aa64-f71b0d6c0885'
      domain: 'mini-compiler'
      description: "Learn how compilers work - create a Lua to Assembly compiler in JavaScript"
      users: [
        name: 'InPermutation'
        avatar: 'https://avatars0.githubusercontent.com/u/1096993?v=3&s=48'
      ]
      categoryIds: [4]
    ,
      projectId: '5e32909a-54f2-43d3-acad-465ff145a3c7'
      domain: 'nodemailer'
      description: "Email sending form with React and Nodemailer"
      categoryIds: [3] 
    ,
      projectId: '546c8e41-ca39-481c-837f-ea830661c315'
      domain: 'rest-api'
      description: "GET and POST RESTful API endpoints using Express"
      categoryIds: [3] 
    ,
      projectId: 'f7a5a47d-b266-4a86-b13d-09a1d2aaea2b'
      domain: 'mongodb'
      description: "Connect and add items to a MongoDB database"
      categoryIds: [3]
    ,
      projectId: '0d184ee3-fd8d-4b94-acf4-b4e686e57375'
      domain: 'passport-js'
      description: "User authentication using Passport.js and OAuth providers"
      categoryIds: [1] 
    ,
      projectId: 'c16a0c85-5369-42c2-9f2f-9144d02c5c93'
      domain: 'backbone-todomvc'
      description: "A To-do list app using Backbone.js (TodoMVC)"
      categoryIds: [1] 
    ,
      projectId: '6c151b93-db34-4be3-b55b-cfc801610685'
      domain: 'mocha-chai'
      description: "Adding tests before deploy with Mocha and Chai"
      users: [
          name: 'etamponi'
          avatar: 'https://avatars3.githubusercontent.com/u/578612?v=3&s=48'
      ]
      categoryIds: [1]
    ,
      projectId: 'a03e4c57-8a6e-440c-8485-faed8c5c885c'
      domain: 'server-side-d3js'
      description: "Rendering SVG charts on the server-side with D3.js"
      categoryIds: [1]
    ,
      projectId: '99749cb1-1e95-402e-8343-354250b61a17'
      domain: 'browserify-middleware'
      description: "Basic Browserify Middleware Hello World example"
      users: [
          name: 'STRd6'
          avatar: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
      ]
      categoryIds: [1]
    ,
      projectId: 'c9bd27a5-9cbc-4592-8189-45847dfabcdb'
      domain: 'twilio-sms'
      description: "Use Twilio to send SMS alerts on page error"
      categoryIds: [3,8]
    ,  
      projectId: '4032b241-bff8-473e-aa6b-eb0c92a4bd06'
      domain: 'twitterbot'
      description: "A template for making fun Twitter bots with the Twit Node.js library"
      users: [
          name: 'fourtonfish'
          avatar: 'https://avatars3.githubusercontent.com/u/3909390?v=3&s=48'
      ]
      categoryIds: [7]       
    ,
      projectId: '38ccccbc-8fb1-4ae5-bf06-b8d67b7dfb6a'
      domain: 'slack-bot-persist'
      description: "Onboarding bot using Slack's Events API, with MongoDB for persistence"
      categoryIds: [7,9]       
    ,
      projectId: '552a115a-c07e-4609-b196-4dbe8fdb449c'
      domain: 'hello-coffee'
      description: "A really nice way to start your next project"
      users: [
          name: 'pketh'
          avatar: 'https://avatars2.githubusercontent.com/u/877072?v=3&s=48'
      ]
      categoryIds: [1] 
    ,
      projectId: '19d39bfe-9d27-4cbb-8326-ad41d1cc61bc'
      domain: 'to-do'
      description: "A simple, minimalist Todo app"
      users: [
          name: 'enriquesanchez'
          avatar: 'https://avatars2.githubusercontent.com/u/3276087?v=3&s=48'
      ]
      categoryIds: [5]
    ,
      projectId: '63f7213c-91c1-4720-a47f-7a384e830aa9'
      domain: 'scrape-it'
      description: "Web scraper using scrape-it"
      categoryIds: [3]
    ,
      projectId: 'c2043750-bda2-4652-9278-15d221f12345'
      domain: 'asl-spell'
      description: "Practice the ASL fingerspelled alphabet"
      users: [
          name: 'jude'
          avatar: 'https://pbs.twimg.com/profile_images/627115681201430528/0rE2ZRqj.jpg'
      ]
      categoryIds: [6]
    ,  
      projectId: '9d603f59-e7f6-4f63-8bd9-d55770bc8e0d'
      domain: 'tetrjs'
      description: "A Tetris clone in JavaScript"
      users: [
          name: 'jennazee'
          avatar: 'https://avatars3.githubusercontent.com/u/1097241?v=3&s=48'
      ]
      categoryIds: [2]      
    ,
      projectId: 'a24de56a-9f77-4503-be6f-730bcd4094f3'
      domain: 'excel-spreadsheet'
      description: "Read and display data from a .xlsx file on Dropbox"
      users: [
          name: 'jude'
          avatar: 'https://pbs.twimg.com/profile_images/627115681201430528/0rE2ZRqj.jpg'
      ]
      categoryIds: [5]  
    ,
      projectId: 'ebd2e0d7-2ee5-4d4f-9086-342bbbf22f35'
      domain: 'flicker-swoop'
      description: "Example implementation of a Lindenmayer system"
      users: [
          name: 'STRd6'
          avatar: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
      ]
      categoryIds: [6]
    ,
      projectId: '54b2142c-d885-42da-86ba-22213877039b'
      domain: 'trello-shopping-list'
      description: "Auto-generate a shopping list from Trello recipe checklists"
      users: [
          name: 'LouManglass' 
          avatar: 'https://avatars3.githubusercontent.com/u/241059?v=3&s=48'        
      ]
      categoryIds: [6]
    ,
      projectId: 'a7b7d5c3-b931-4ce0-a746-fe06ed8da62a'
      domain: 'frogfeels'
      description: 'Draw some feelings, see what everyone else drew weekly'
      users: [
          name: 'pketh'
          avatar: 'https://avatars2.githubusercontent.com/u/877072?v=3&s=48'
      ]
      categoryIds: [6]
    ,
      projectId: '1c04125e-84eb-4ab4-b5db-347ad757f4eb'
      domain: 'node-sass'
      description: "Demo project showing how to use Sass middleware"
      users: [
          name: 'STRd6'
          avatar: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
      ]
      categoryIds: [1] 
    ,
      projectId: '4d787ffa-d62b-4907-91ef-e86c1e1e1335'
      domain: 'hoodie'
      description: "Starter project using Hoodie"
      users: [
          name: 'gr2m'
          avatar: 'https://avatars2.githubusercontent.com/u/39992?v=3&s=48'
      ]
      categoryIds: [1]   
    ,
      projectId: 'c4f87dae-fa3a-437e-9e13-fa79e98e3952'
      domain: 'font-awesome-export'
      description: "Creates the mouse cursor and image code for Font Awesome icons"
      users: [
          name: 'olragon'
          avatar: 'https://avatars2.githubusercontent.com/u/47636?v=3&s=48'
      ]
      categoryIds: [6]
    ,
      projectId: '5e80c868-d95c-4a76-b6a6-291d5d61a4c0'
      domain: 'hipchat-addon'
      description: "A fully functional HipChat add-on"
      users: [
          name: 'rmanalan'
          avatar: 'https://avatars2.githubusercontent.com/u/549?v=3&s=48'
      ]
      categoryIds: [1]
    ,
      projectId: '008c399a-3f86-45ad-8131-df3a14b0e7ed'
      domain: 'processing-js'
      description: "A hypnotic processing.js sketch"
      users: [
          name: 'JosephLaurino'
          avatar: 'https://avatars2.githubusercontent.com/u/755681?v=3&s=48'
      ]
      categoryIds: [1]
    ,
      projectId: '41d23949-7ea8-4e05-8724-21a78a4b9243'
      domain: 'trello-webhooks'
      description: "Lists Trello board activity via webhooks"
      categoryIds: [5]      
    ,
      projectId: '3af10551-a9bb-47e1-83a3-958a8bd45860'
      domain: 'freelancer-theme'
      description: "A one page Bootstrap website theme for freelancers"
      users: [
          name: 'davidtmiller'
          avatar: 'https://avatars3.githubusercontent.com/u/8400627?v=3&s=48'
      ]
      categoryIds: [4]  
    ,
      projectId: 'ab2a48b3-b6e1-4883-a4ea-045dfb87cdc8'
      domain: 'creative-theme'
      description: "A one page Bootstrap website theme for portfolios and businesses"
      users: [
          name: 'davidtmiller'
          avatar: 'https://avatars3.githubusercontent.com/u/8400627?v=3&s=48'
      ]
      categoryIds: [4] 
    ,
      projectId: 'fd904fcf-ea8b-415b-ac02-d873c2fd0803'
      domain: 'beginner-javascript'
      description: "Learn the basics of HTML, JavaScript, triggering actions and using jQuery"
      categoryIds: [4]  
    ,
      projectId: 'fc07966b-c035-4ff2-82e9-75548756a8e3'
      domain: 'intermediate-javascript'
      description: "Learn about logging, listening, variables, conditionals, arrays & functions"
      categoryIds: [4] 
    ,
      projectId: 'a9e55c25-bf40-4162-b1b5-dc33047c0cdc'
      domain: 'slack-slash-command'
      description: "Respond to custom Slash Commands in Slack, using MongoDB for persistence"
      categoryIds: [7,9]
    ,  
      projectId: '0bbef086-c8da-44c3-a854-c1ea07b9347f'
      domain: 'circles-bouncing-off-lines'
      description: "Learn how to calculate the movement of circles as they bounce off lines"
      users: [
        name: 'maryrosecook'
        avatar: 'https://avatars3.githubusercontent.com/u/2716?v=3&s=48'
      ]
      categoryIds: [4] 
    ,
      projectId: '52926f2f-6fd3-428c-8846-a2b02b4d20d3'
      domain: 'auth0'
      description: "Let Auth0 take care of how users authenticate with your app"
      categoryIds: [3]
    ,
      projectId: '681cc882-059d-4b05-a1f6-6cbc099cc79c'
      domain: 'alexa-skill'
      description: "Ask Alexa for airport information using an airport code"
      categoryIds: [7,8]
    ,
      projectId: 'ca73ace5-3fff-4b8f-81c5-c64452145271'
      domain: 'messenger-bot'
      description: "A Facebook Messenger Platform bot template"
      users: [
          name: 'fbsamples'
          avatar: 'https://avatars1.githubusercontent.com/u/1541324?v=3&s=48'
      ]      
      categoryIds: [7]
    ,  
      projectId: 'a4c42aef-7c70-484b-ab24-8c344063a7c8'
      domain: 'chewy'
      description: "Give Alexa the power of the Force with this Wookieepedia powered Skill"
      users: [
          name: 'stretchyboy'
          avatar: 'https://avatars1.githubusercontent.com/u/229326?v=3&s=48'
      ]
      categoryIds: [7]       
    ,
      projectId: '68ea9bee-f345-4677-a916-f7c67004ae2d'
      domain: 'grunt-js'
      description: "Example app that minifies a JS file with Uglify using Grunt"
      categoryIds: [1]
    ,
      projectId: 'bd480ea2-8578-4c05-8924-41328b922d16'
      domain: 'parse-server'
      description: "An example Parse Server project using Express"
      users: [
          name: 'AndrewLane'
          avatar: 'https://avatars3.githubusercontent.com/u/479232?v=3&s=48'
      ]
      categoryIds: [3]
    ,
      projectId: '7c96ce5b-c85b-41f9-b2fa-174f7d7475b8'
      domain: 'parse-dashboard'
      description: "A sample project implementing Parse Dashboard"
      users: [
          name: 'AndrewLane'
          avatar: 'https://avatars3.githubusercontent.com/u/479232?v=3&s=48'
      ]
      categoryIds: [5]
    ,
      projectId: '26e3250c-12a8-4f2b-b122-04b217da32cb'
      domain: 'parse-todo'
      description: "Example To-do app that uses Parse Server as a backend"
      categoryIds: [5] 
    ,
      projectId: '519836db-41bb-43a8-b2d5-f6d9c55e314a'
      domain: 'node-twitter'
      description: "Full Twitter clone app using Express and MongoDB"
      users: [
          name: 'vinitkumar'
          avatar: 'https://avatars3.githubusercontent.com/u/537678?v=3&s=48'
      ]
      categoryIds: [6]
    ,  
      projectId: '0539a08d-bcda-458e-8647-94813e4248b4'
      domain: 'react-tutorial'
      description: "React comment box tutorial example"
      categoryIds: [1]
    ,
      projectId: 'fb2f9ebf-77b2-4f81-9f07-e5425f261f57'
      domain: 'firebase-quickstart'
      description: "A simple social blog app using Firebase"
      categoryIds: [3]
    ,
      projectId: 'a787ebb0-b8ea-4a1f-8b6e-20d72cc6018d'
      domain: 'slide-show'
      description: "Example presentation slide show using reveal.js"
      categoryIds: [5]
    ,
      projectId: '3549cd9d-7768-447e-9d74-fa70370d6a1f'
      domain: 'salesforce-quickstart'
      description: "Handles OAuth and commands using SOQL, Search and Chatter APIs"
      categoryIds: [5,3] 
    ,
      projectId: '732e6975-8c3a-44eb-8ac4-7932fd25440d'
      domain: 'mongodb-sync'
      description: "A simple blog app using MongoDB database to store data"
      categoryIds: [3]
    ,  
      projectId: '65100072-2918-465c-962a-65ccb765b6de'
      domain: 'mongodb-async'
      description: "A simple blog app using MongoDB database to store data"
      categoryIds: [3]   
    ,  
      projectId: '5dd56de5-79af-444e-a17e-bd60230962eb'
      domain: 'sqlite3-db'
      description: "List app that demos a SQLite3 database using the Sequelize ORM"
      categoryIds: [3]
    ,
      projectId: '6c89fbec-c325-4618-9221-8da91296c6bb'
      domain: 'node-beginner'
      description: "A beginner's guide to Node.js and JavaScript. Get started by selecting 'View Code'"
      users: [
        name: 'manuelkiessling'
        avatar: 'https://avatars3.githubusercontent.com/u/206592?v=3&s=48'
      ]
      categoryIds: [4]
    ,  
      projectId: 'd89cf37a-fef6-4855-b0dc-e029aa6c402f'
      domain: 'javascripting'
      description: "18 exercises, covering the basics of JavaScript from variables to functions"
      categoryIds: [4]     
    ,
      projectId: '095a1538-8c44-4b27-b0fe-936d194318c2'
      domain: 'slack-bot'
      description: "Example Onboarding bot using Slack's Events API"
      categoryIds: [7,9]
    ,
      projectId: 'ea79cf2c-9dce-4e84-ac29-3b6d1941c452'
      domain: 'add-to-alexa'
      description: "Generate an Alexa Flash Briefing compatible JSON feed from submitted articles"
      categoryIds: [7,8] 
    ,
      projectId: 'feca3b9d-2ddb-43ff-98fa-57abfe77506b'
      domain: 'drawing-game'
      description: "Draw in real-time with multiple other people, and see what they're drawing too"
      categoryIds: [2]      
    ,
      projectId: 'd04c9a09-d45a-4aaa-8f33-a1e2772945d0'
      domain: 'itunes-art'
      description: "Get the logos and screenshots from any app in the Apple iOS App Store"
      categoryIds: [5]
    ,  
      projectId: '58fe13bd-0688-49f3-b562-c3b5817fc5d6'
      domain: 'ne-db'
      description: "A list app that demos interacting with a NeDB database"
      categoryIds: [3]
    ,  
      projectId: '2d2e28d2-e17b-4934-a643-b1c5ba787a0b'
      domain: 'nuxt-starter'
      description: "Editable live starter for nuxt.js"
      users: [
        name: 'nuxt'
        avatar: 'https://avatars3.githubusercontent.com/u/23360933?v=3&s=48'
      ]
      categoryIds: [1] 
    ,  
      projectId: 'a5a7b583-22ce-4f4f-a597-b5ec6a97c1ed'
      domain: 'vue-hn'
      description: "Hacker News clone with server-side rendering, built w/ Vue 2.0, vue-router & vuex"
      users: [
        name: 'vuejs'
        avatar: 'https://avatars3.githubusercontent.com/u/6128107?v=3&s=48'
      ]
      categoryIds: [6] 
    ,  
      projectId: '61b1736e-6fc1-47f5-addb-2a925099abc4'
      domain: 'vue-ssr'
      description: "Vue 2.0 Server-side Rendering using only ES5 with no build step"
      users: [
        name: 'vuejs'
        avatar: 'https://avatars3.githubusercontent.com/u/6128107?v=3&s=48'
      ]
      categoryIds: [1]
    ,  
      projectId: 'b7e334f3-109b-4b92-bead-d995cbba5950'
      domain: 'fogbugz-js'
      description: "A lightweight, promise-based wrapper around the FogBugz API"
      users: [
          name: 'bigdogwillfeed'
          avatar: 'https://avatars3.githubusercontent.com/u/4453639?v=3&s=48'
      ]
      categoryIds: [3]
    ,  
      projectId: 'd5d11c11-c239-4b16-ae23-def8e2687c25'
      domain: 'fogbugz-webhooks'
      description: "A simple server that handles incoming Webhooks delivered from FogBugz"
      categoryIds: [5]  
    ,  
      projectId: '6ef506f0-b790-454b-a9b8-f31347cc69f3'
      domain: 'multiplayer-game'
      description: "Real-time multiplayer game using Node.js, Socket.io and HTML5 Canvas"
      users: [
        name: 'underscorediscovery'
        avatar: 'https://avatars3.githubusercontent.com/u/236374?v=3&s=48'
      ]
      categoryIds: [2,3]
    ,  
      projectId: 'b76e18c8-01d4-48ce-9516-af13503c2a53'
      domain: 'pixelatize'
      description: "Upload an image and '8-bit-ify' or pixelate or whatever you want to call it"
      users: [
        name: 'jennschiffer'
        avatar: 'https://avatars3.githubusercontent.com/u/341305?v=3&s=48'
      ]
      categoryIds: [6] 
    ,  
      projectId: '57237357-0897-4eed-a5ec-b35c4432502c'
      domain: 'space-invaders'
      description: "Learn about the game loop, collisions, input, drawing and sounds"
      users: [
        name: 'maryrosecook'
        avatar: 'https://avatars3.githubusercontent.com/u/2716?v=3&s=48'
      ]
      categoryIds: [2] 
    ,  
      projectId: '21ec6159-b62d-4397-9de2-4736d40aa18f'
      domain: 'voting'
      description: "A simple polling and voting app"
      users: [
          name: 'hsubox'
          avatar: 'https://avatars3.githubusercontent.com/u/470813?v=3&s=48'
      ]
      categoryIds: [5]
    ,  
      projectId: '96ca67fd-d729-4a35-9edc-8ee01bdedb63'
      domain: 'mini-breakout'
      description: "A simple Phaser-based Breakout clone"
      users: [
          name: 'anildash'
          avatar: 'https://avatars3.githubusercontent.com/u/84376?v=3&s=48'
      ]
      categoryIds: [2] 
    ,  
      projectId: 'd76dfe3f-23bc-4a7e-9629-f110d2ffa268'
      domain: 'browser-quest'
      description: "A HTML5/JavaScript massively multiplayer online role-playing game"
      users: [
          name: 'glecollinet'
          avatar: 'https://avatars3.githubusercontent.com/u/364962?v=3&s=48'
        ,
          name: 'sork'
          avatar: 'https://avatars3.githubusercontent.com/u/184017?v=3&s=48'
      ]
      categoryIds: [2]
    ,  
      projectId: '48d9a081-8ac6-497d-bc28-d3a32df56834'
      domain: 'blockspring'
      description: "Use Blockspring to easily get data from third-party APIs"
      categoryIds: [3]
    ,
      projectId: '454c12bf-21a2-485d-ab64-975d05525c16'
      domain: 'nondescript-dog'
      description: "Play multiplayer Snake over websockets"
      users: [
          name: 'benoror'
          avatar: 'https://avatars0.githubusercontent.com/u/119117?v=3&s=48'
      ]
      categoryIds: [2]
    ,
      projectId: '9fe017c4-756e-4c58-b10b-e5412e32aefb'
      domain: 'material-design'
      description: "A quick way to bootstrap a site or app with Material"
      users: [
          name: 'ghaida'
          avatar: 'https://avatars3.githubusercontent.com/u/342672?v=3&s=48'
      ]
      categoryIds: [3]
    ,
      projectId: '92d725da-5ec6-467d-959f-79cf20b8b93c'
      domain: 'coffee-talks'
      description: "Heartfelt dev talks for humans, using Airtable as the database"
      users: [
          name: 'rosamcgee'
          avatar: 'https://avatars0.githubusercontent.com/u/2496274?v=3&s=48'
        ,
          name: 'pketh'
          avatar: 'https://avatars2.githubusercontent.com/u/877072?v=3&s=48'
      ]
      categoryIds: [6]
    ,
      projectId: '1a511228-1f09-429c-a2d2-4a3e5ca7d07d'
      domain: 'peek-at-posts'
      description: "Slack slash command to peek at the last 3 posts on a WordPress site"
      users: [
          name: 'tharsheblows'
          avatar: 'https://avatars1.githubusercontent.com/u/1530368?v=3&s=48'
      ]
      categoryIds: [7,9]
    ,
      projectId: '12834ffd-d5ed-423a-b486-9f297f5cd04f'
      domain: 'botkit-slack'
      description: "Starter kit for creating a Botkit-powered Slack app"
      users: [
          name: 'howdyai'
          avatar: 'https://avatars1.githubusercontent.com/u/16260958?v=3&s=48'
      ]
      categoryIds: [7,9]
    ,
      projectId: '4761356a-9369-4e79-9d1e-a8306e8c00b5'
      domain: 'multi-ifttt-triggers'
      description: "Trigger multiple actions from a single command"
      categoryIds: [8]
    ,
      projectId: '0e1a6c28-f95f-4920-a691-27697b572b24'
      domain: 'conditional-ifttt-triggers'
      description: "Trigger one or more IFTTT services when certain conditions are met"
      categoryIds: [8]
    ,
      projectId: '1545abd9-68a2-4c4a-937b-8ee19ac2aa3e'
      domain: 'zapier-webhooks'
      description: "Send and receive webhooks to and from Zapier"
      categoryIds: [8,5]
    ,
      projectId: 'af1e91ec-2f6d-4a37-82cb-21c8bd289460'
      domain: 'google-home'
      description: "Which is better, Daddy or Chips? Your Google Home knows"
      categoryIds: [8,7]
    ,
      projectId: 'cfc5bdd8-35cf-4f95-9ea0-4d637739ac6d'
      domain: 'particle-api'
      description: "Control an LED on a Particle device using the Particle JS API"
      categoryIds: [8,3]
    ,
      projectId: '9f67720d-ad82-43b1-a7a5-2edc81e35b48'
      domain: 'littlebits-api'
      description: "Control your CloudBit device using the littleBits API"
      categoryIds: [8,3]
    ,
      projectId: 'cbd095f2-e0a5-4f7d-8113-2fc54d79b1ea'
      domain: 'temboo'
      description: "Temboo example app that uses their Node.js SDK"
      categoryIds: [8] 
    ,
      projectId: '5d5360ae-ed85-4a92-b60e-421acb2da08a'
      domain: 'coffee-script-base'
      description: "CoffeeScript backend that compiles clientside code with CoffeeScript using Browserify middleware"
      users: [
          name: 'STRd6'
          avatar: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
      ]      
      categoryIds: [3]
    ,
      projectId: '55dbb2a4-94d9-434f-9dcc-1432c975de1c'
      domain: 'superbowl-squares'
      description: "Start your own Football Squares pool with friends and colleagues"    
      categoryIds: [10] 
    ,
      projectId: '902cbaf0-e4e9-47c0-80b2-fe7ef583d679'
      domain: 'big-game-bingo'
      description: "Watch the big game for the ads? Embrace the clichés and play Big Game Bingo!"     
      categoryIds: [10] 
    ,
      projectId: '56e665e5-e0a8-46c8-9476-8d9b731117dd'
      domain: 'quarterback-quiz'
      description: "Test your Football knowledge with this Quarterback quiz"     
      categoryIds: [10] 
    ,
      projectId: '514be323-4add-49c4-806d-e7f8fc27e933'
      domain: 'livechat-sample-agent-app'
      description: "Sample app demonstrating how to build a LiveChat App Extension"
      users: [
          name: 'livechat'
          avatar: 'https://avatars2.githubusercontent.com/u/1615526?v=3&s=48'
      ]      
      categoryIds: [3,5] 
    ,
      projectId: '4a351a6e-f316-495c-b107-8b91ade9746e'
      domain: 'hackathon-starter'
      description: "A boilerplate for Node.js web applications"
      users: [
          name: 'sahat'
          avatar: 'https://avatars2.githubusercontent.com/u/544954?v=3&s=48'
      ]      
      categoryIds: [3]     
  ]


