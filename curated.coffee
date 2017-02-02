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

module.exports =

  featured: -> [
      name: 'Big Game Bingo'
      url: 'big-game-bingo'
      id: '902cbaf0-e4e9-47c0-80b2-fe7ef583d679'
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
      url: 'quarterback-quiz'
      id: '56e665e5-e0a8-46c8-9476-8d9b731117dd'
      img: "https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Ffeatured-quarterback-quiz.png"
      users: [
          name: 'garethx'
          avatar: 'https://avatars3.githubusercontent.com/u/1830035?v=3&s=48'
      ]      
    ,
      name: 'Super Bowl Squares'
      url: 'superbowl-squares'
      id: '55dbb2a4-94d9-434f-9dcc-1432c975de1c'
      img: "https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Ffeatured-superbowl-squares.png"
      users: [
          name: 'etamponi'
          avatar: 'https://avatars3.githubusercontent.com/u/578612?v=3&s=48'
      ]
  ] 

  # type 1: categories listed on the site
  # type 2: WIP collections, not listed
  # type 3: company collections, not listed
  categories: -> [
      name: 'Hello Worlds'
      url: 'hello-worlds'
      img: computer
      color: "#FCF3AF"
      description: "Experiment with technologies and libraries by remixing these sample projects."
      background: "rgba(252, 243, 174, #{backgroundOpacity})"
      id: 1
      type: 1
    ,
      name: 'Games'
      url: 'games'
      img: tetris
      color: "#FBA058"
      description: "Make your own cool games. Get that idea out of your head and into the world."
      background: "rgba(251, 159, 88, #{backgroundOpacity})"
      id: 2
      type: 1      
    ,
      name: 'Building Blocks'
      url: 'building-blocks'
      img: shapes
      color: "#31cdd4"
      description: "Databases, emailing and more. The bread and butter basics of modern web dev."
      background: "rgba(49, 204, 212, #{backgroundOpacity})"
      id: 3
      type: 1      
    ,
      name: 'Learn to Code'
      url: 'learn-to-code'
      img: education
      color: "#FFD1C6"
      description: "Learn by doing, then breaking, then doing some more. You got this!"
      background: "rgba(255, 209, 198, #{backgroundOpacity})"
      id: 4
      type: 1      
    ,
      name: 'Tools for Work'
      url: 'tools-for-work'
      img: coffee
      color: "#70a4d8"
      description: "Every business is a snowflake. Build and customize your own tools and integrations."
      background: "rgba(112, 164, 216, #{backgroundOpacity})"
      id: 5
      type: 1      
    ,
      name: 'Community Picks'
      url: 'community-picks'
      img: diamond
      color: "#9DE0FC"
      description: "Community submissions that do the flyest things ✨"
      background: "rgba(156, 224, 252, #{backgroundOpacity})"
      id: 6
      type: 1      
    ,
      name: 'Handy Bots'
      url: 'handy-bots'
      img: robot
      color: "#C9BFF4"
      description: "Build helpful tools, meme generators, or Westworld. Your bots have your back."
      background: "rgba(201, 191, 244, #{backgroundOpacity})"
      id: 7
      type: 1      
    ,
      name: 'Hardware'
      url: 'hardware'
      img: hardware
      color: "rgb(48, 220, 166)"
      description: "Connect your gadgets and gizmos to the world – or your kitchen."
      background: "rgba(48, 220, 166, #{backgroundOpacity})"
      id: 8
      type: 1
    ,
      name: 'Slack Apps'
      url: 'slack'
      img: slack
      color: "#FCF3AF"
      description: "Bots, slash commands and apps that integrate with Slack."
      background: "rgba(252, 243, 174, #{backgroundOpacity})"
      id: 9
      type: 3
    ,
      name: 'Big Game Apps'
      url: 'big-game'
      img: superbowl
      color: "#FCF3AF"
      description: "From gridiron to your editor, create apps for the big game."
      background: "rgba(252, 243, 174, #{backgroundOpacity})"
      id: 10
      type: 2    
  ]

  projects: -> [
      name: 'Memory!'
      projectId: 1
      appId: '56b6e738-2249-4332-9b49-8d0efe03aad3'
      editorUrl: 'memory-game'
      likes: 26
      remixes: null
      description: 'Memory matching game with different themes for cards'
      users: [
        name: 'etamponi'
        avatar: 'https://avatars3.githubusercontent.com/u/578612?v=3&s=48'
      ]
      categoryId: [2]
    ,
      name: 'Kerbal Space Program'
      projectId: 2
      appId: '1400a3bd-f901-4883-8394-a38eeac0d1f0'
      editorUrl: 'space-program'
      likes: 18
      remixes: null
      description: "Launch your spaceship into orbit. Don't die."
      users: [
        name: 'InPermutation'
        avatar: 'https://avatars0.githubusercontent.com/u/1096993?v=3&s=48'
      ]
      categoryId: [2]
    ,
      name: 'Pong Solo'
      projectId: 3
      appId: 'e1a17ca2-9167-4695-ba19-e0d5c34d09bb'
      editorUrl: 'pong-solo'
      likes: 5
      remixes: null
      description: "Play Pong against a brick wall; now even harder to beat!"
      users: [
        name: 'STRd6'
        avatar: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
      ]
      categoryId: [2]
    ,
      name: 'Fancy Soundboard'
      projectId: 4
      appId: '397d14ff-0309-4411-895a-fda9e935c44b'
      editorUrl: 'soundboard'
      likes: 21
      remixes: null
      description: 'Click pictures, listen to sounds, celebrate'
      users: [
          name: 'STRd6'
          avatar: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
        ,
          name: 'pketh'
          avatar: 'https://avatars2.githubusercontent.com/u/877072?v=3&s=48'
      ]
      categoryId: [2]
    ,
      name: 'SVG Editor'
      projectId: 5
      appId: 'bb648dc0-74b3-4571-8840-6bf49cf84e66'
      editorUrl: 'image-editor'
      likes: 3
      remixes: null
      description: "A thing for making SVG images. Draw with it."
      users: [
          name: 'InPermutation'
          avatar: 'https://avatars0.githubusercontent.com/u/1096993?v=3&s=48'
      ]
      categoryId: [6]
    ,
      name: 'Data Dashboard'
      projectId: 8
      appId: '824edd48-c9bd-4aee-a3fb-561bb97344ed'
      editorUrl: 'data-dashboard'
      likes: 13
      remixes: null
      description: "Display data from Google Sheets on a live dashboard"
      categoryId: [5]
    ,
      name: 'Socket.io Chat'
      projectId: 9
      appId: 'd5323c5b-d1fd-4d39-97ac-c5d8b4cfd3f8'
      editorUrl: 'socketio-chat'
      likes: 9
      remixes: null
      description: "A simple chat demo using Socket.io"
      categoryId: [3]
    ,
      name: 'Mini Lua Compiler'
      projectId: 10
      appId: '13e7a934-0610-41e9-aa64-f71b0d6c0885'
      editorUrl: 'mini-compiler'
      likes: 18
      remixes: null
      description: "Learn how compilers work - create a Lua to Assembly compiler in JavaScript"
      users: [
        name: 'InPermutation'
        avatar: 'https://avatars0.githubusercontent.com/u/1096993?v=3&s=48'
      ]
      categoryId: [4]
    ,
      name: 'Sending Email'
      projectId: 11
      appId: '5e32909a-54f2-43d3-acad-465ff145a3c7'
      editorUrl: 'nodemailer'
      projectAvatarNeedsLegibility: true
      likes: 8
      remixes: null
      description: "Email sending form with React and Nodemailer"
      categoryId: [3] 
    ,
      name: 'API Endpoint'
      projectId: 12
      appId: '546c8e41-ca39-481c-837f-ea830661c315'
      editorUrl: 'rest-api'
      likes: 3
      remixes: null
      description: "GET and POST RESTful API endpoints using Express"
      categoryId: [3] 
    ,
      name: 'Simple MongoDB Example'
      projectId: 13
      appId: 'f7a5a47d-b266-4a86-b13d-09a1d2aaea2b'
      editorUrl: 'mongodb'
      likes: 5
      remixes: null
      description: "Connect and add items to a MongoDB database"
      categoryId: [3]
    ,
      name: 'Passport.js'
      projectId: 14
      appId: '0d184ee3-fd8d-4b94-acf4-b4e686e57375'
      editorUrl: 'passport-js'
      likes: 9
      remixes: null
      description: "User authentication using Passport.js and OAuth providers"
      categoryId: [1] 
    ,
      name: 'Backbone.js'
      projectId: 16
      appId: 'c16a0c85-5369-42c2-9f2f-9144d02c5c93'
      editorUrl: 'backbone-todomvc'
      likes: 3
      remixes: null
      description: "A To-do list app using Backbone.js (TodoMVC)"
      categoryId: [1] 
    ,
      name: 'Mocha and Chai'
      projectId: 17
      appId: '6c151b93-db34-4be3-b55b-cfc801610685'
      editorUrl: 'mocha-chai'
      likes: 13
      remixes: null
      description: "Adding tests before deploy with Mocha and Chai"
      users: [
          name: 'etamponi'
          avatar: 'https://avatars3.githubusercontent.com/u/578612?v=3&s=48'
      ]
      categoryId: [1]
    ,
      name: 'D3.js'
      projectId: 18
      appId: 'a03e4c57-8a6e-440c-8485-faed8c5c885c'
      editorUrl: 'server-side-d3js'
      likes: 2
      remixes: null
      description: "Rendering SVG charts on the server-side with D3.js"
      categoryId: [1]
    ,
      name: 'Browserify Middleware'
      projectId: 19
      appId: '99749cb1-1e95-402e-8343-354250b61a17'
      editorUrl: 'browserify-middleware'
      likes: 5
      remixes: null
      description: "Basic Browserify Middleware Hello World example"
      users: [
          name: 'STRd6'
          avatar: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
      ]
      categoryId: [1]
    ,
      name: 'Sending SMS with Twilio'
      projectId: 20
      appId: 'c9bd27a5-9cbc-4592-8189-45847dfabcdb'
      editorUrl: 'twilio-sms'
      likes: 9
      remixes: null
      description: "Use Twilio to send SMS alerts on page error"
      categoryId: [3,8]
    ,  
      name: 'Twitter Bot'
      projectId: 88
      appId: '4032b241-bff8-473e-aa6b-eb0c92a4bd06'
      editorUrl: 'twitterbot'
      likes: 15
      remixes: null
      description: "A template for making fun Twitter bots with the Twit Node.js library"
      users: [
          name: 'fourtonfish'
          avatar: 'https://avatars3.githubusercontent.com/u/3909390?v=3&s=48'
      ]
      categoryId: [7]       
    ,
      name: 'Slack Bot (with persistence)'
      projectId: 22
      appId: '38ccccbc-8fb1-4ae5-bf06-b8d67b7dfb6a'
      editorUrl: 'slack-bot-persist'
      likes: 19
      remixes: null
      description: "Onboarding bot using Slack's Events API, with MongoDB for persistence"
      categoryId: [7,9]       
    ,
      name: 'CoffeeScript, Jade & Stylus'
      projectId: 23
      appId: '552a115a-c07e-4609-b196-4dbe8fdb449c'
      editorUrl: 'hello-coffee'
      likes: 5
      remixes: null
      description: "A really nice way to start your next project"
      users: [
          name: 'pketh'
          avatar: 'https://avatars2.githubusercontent.com/u/877072?v=3&s=48'
      ]
      categoryId: [1] 
    ,
      name: 'Simply Done'
      projectId: 24
      appId: '19d39bfe-9d27-4cbb-8326-ad41d1cc61bc'
      editorUrl: 'to-do'
      likes: 15
      remixes: null
      description: "A simple, minimalist Todo app"
      users: [
          name: 'enriquesanchez'
          avatar: 'https://avatars2.githubusercontent.com/u/3276087?v=3&s=48'
      ]
      categoryId: [5]
    ,
      name: 'Web Scraper'
      projectId: 25
      appId: '63f7213c-91c1-4720-a47f-7a384e830aa9'
      editorUrl: 'scrape-it'
      likes: 7
      remixes: null
      description: "Web scraper using scrape-it"
      categoryId: [3]
    ,
      name: 'Learn ASL Alphabet'
      projectId: 28
      appId: 'c2043750-bda2-4652-9278-15d221f12345'
      editorUrl: 'asl-spell'
      likes: 7
      remixes: null
      description: "Practice the ASL fingerspelled alphabet"
      users: [
          name: 'jude'
          avatar: 'https://pbs.twimg.com/profile_images/627115681201430528/0rE2ZRqj.jpg'
      ]
      categoryId: [6]
    ,  
      name: 'Tetrjs'
      projectId: 86
      appId: '9d603f59-e7f6-4f63-8bd9-d55770bc8e0d'
      editorUrl: 'tetrjs'
      likes: 12
      remixes: null
      description: "A Tetris clone in JavaScript"
      users: [
          name: 'jennazee'
          avatar: 'https://avatars3.githubusercontent.com/u/1097241?v=3&s=48'
      ]
      categoryId: [2]      
    ,
      name: 'Display Data from Excel'
      projectId: 29
      appId: 'a24de56a-9f77-4503-be6f-730bcd4094f3'
      editorUrl: 'excel-spreadsheet'
      likes: 9
      remixes: null
      description: "Read and display data from a .xlsx file on Dropbox"
      users: [
          name: 'jude'
          avatar: 'https://pbs.twimg.com/profile_images/627115681201430528/0rE2ZRqj.jpg'
      ]
      categoryId: [5]  
    ,
      name: 'L-system'
      projectId: 30
      appId: 'ebd2e0d7-2ee5-4d4f-9086-342bbbf22f35'
      editorUrl: 'flicker-swoop'
      likes: 7
      remixes: null
      description: "Example implementation of a Lindenmayer system"
      users: [
          name: 'STRd6'
          avatar: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
      ]
      categoryId: [6]
    ,
      name: 'Trello Shopping List Generator'
      projectId: 32
      appId: '54b2142c-d885-42da-86ba-22213877039b'
      editorUrl: 'trello-shopping-list'
      likes: 15
      remixes: null
      description: "Auto-generate a shopping list from Trello recipe checklists"
      users: [
          name: 'LouManglass' 
          avatar: 'https://avatars3.githubusercontent.com/u/241059?v=3&s=48'        
      ]
      categoryId: [6]
    ,
      name: 'Frog Feels'
      projectId: 33
      appId: 'a7b7d5c3-b931-4ce0-a746-fe06ed8da62a'
      editorUrl: 'frogfeels'
      likes: 36
      remixes: null
      description: 'Draw some feelings, see what everyone else drew weekly'
      users: [
          name: 'pketh'
          avatar: 'https://avatars2.githubusercontent.com/u/877072?v=3&s=48'
      ]
      categoryId: [6]
    ,
      name: 'Sass Middleware'
      projectId: 34
      appId: '1c04125e-84eb-4ab4-b5db-347ad757f4eb'
      editorUrl: 'node-sass'
      likes: 7
      remixes: null
      description: "Demo project showing how to use Sass middleware"
      users: [
          name: 'STRd6'
          avatar: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
      ]
      categoryId: [1] 
    ,
      name: 'Hoodie'
      projectId: 35
      appId: '4d787ffa-d62b-4907-91ef-e86c1e1e1335'
      editorUrl: 'hoodie'
      projectAvatarNeedsLegibility: true
      likes: 9
      remixes: null
      description: "Starter project using Hoodie"
      users: [
          name: 'gr2m'
          avatar: 'https://avatars2.githubusercontent.com/u/39992?v=3&s=48'
      ]
      categoryId: [1]   
    ,
      name: 'Font Awesome Export tool'
      projectId: 36
      appId: 'c4f87dae-fa3a-437e-9e13-fa79e98e3952'
      editorUrl: 'font-awesome-export'
      likes: 11
      remixes: null
      description: "Creates the mouse cursor and image code for Font Awesome icons"
      users: [
          name: 'olragon'
          avatar: 'https://avatars2.githubusercontent.com/u/47636?v=3&s=48'
      ]
      categoryId: [6]
    ,
      name: 'HipChat Add-on'
      projectId: 37
      appId: '5e80c868-d95c-4a76-b6a6-291d5d61a4c0'
      editorUrl: 'hipchat-addon'
      likes: 5
      remixes: null
      description: "A fully functional HipChat add-on"
      users: [
          name: 'rmanalan'
          avatar: 'https://avatars2.githubusercontent.com/u/549?v=3&s=48'
      ]
      categoryId: [1]
    ,
      name: 'Processing.js'
      projectId: 39
      appId: '008c399a-3f86-45ad-8131-df3a14b0e7ed'
      editorUrl: 'processing-js'
      likes: 9
      remixes: null
      description: "A hypnotic processing.js sketch"
      users: [
          name: 'JosephLaurino'
          avatar: 'https://avatars2.githubusercontent.com/u/755681?v=3&s=48'
      ]
      categoryId: [1]
    ,
      name: 'Postcard Maker'
      projectId: 40,
      appId: '70b0550f-da2e-4d0e-bb9b-c81436d7d8d4',
      editorUrl: 'time-mustang'
      likes: 19
      remixes: null
      description: "Upload an image and it'll create and post out a postcard"
      users: [
          name: 'margalit'
          avatar: 'https://avatars2.githubusercontent.com/u/2268424?v=3&s=48'
      ]
      categoryId: [6]
    ,
      name: 'Trello Webhook Server'
      projectId: 44
      appId: '41d23949-7ea8-4e05-8724-21a78a4b9243'
      editorUrl: 'trello-webhooks'
      likes: 9
      remixes: null
      description: "Lists Trello board activity via webhooks"
      categoryId: [5]      
    ,
      name: 'Instant Website: Freelancer Bootstrap Template'
      projectId: 46
      appId: '3af10551-a9bb-47e1-83a3-958a8bd45860'
      editorUrl: 'freelancer-theme'
      likes: 11
      remixes: null
      description: "A one page Bootstrap website theme for freelancers"
      users: [
          name: 'davidtmiller'
          avatar: 'https://avatars3.githubusercontent.com/u/8400627?v=3&s=48'
      ]
      categoryId: [4]  
    ,
      name: 'Instant Website: Creative Bootstrap Template'
      projectId: 47
      appId: 'ab2a48b3-b6e1-4883-a4ea-045dfb87cdc8'
      editorUrl: 'creative-theme'
      likes: 10
      remixes: null
      description: "A one page Bootstrap website theme for portfolios and businesses"
      users: [
          name: 'davidtmiller'
          avatar: 'https://avatars3.githubusercontent.com/u/8400627?v=3&s=48'
      ]
      categoryId: [4] 
    ,
      name: 'CoderDojo Kata: Beginner JavaScript Sushi'
      projectId: 48
      appId: 'fd904fcf-ea8b-415b-ac02-d873c2fd0803'
      editorUrl: 'beginner-javascript'
      likes: 7
      remixes: null
      description: "Learn the basics of HTML, JavaScript, triggering actions and using jQuery"
      categoryId: [4]  
    ,
      name: 'Assets.js'
      projectId: 49
      appId: 'cb02d9ae-61ed-4053-b465-d6e2e9656ac3'
      editorUrl: 'assets-lib'
      likes: 8
      remixes: null
      description: "Use relative paths to serve your assets on HyperDev"
      users: [
          name: 'etamponi'
          avatar: 'https://avatars3.githubusercontent.com/u/578612?v=3&s=48'
      ]
      categoryId: [1] 
    ,
      name: 'CoderDojo Kata: Intermediate JavaScript Sushi'
      projectId: 50
      appId: 'fc07966b-c035-4ff2-82e9-75548756a8e3'
      editorUrl: 'intermediate-javascript'
      likes: 4
      remixes: null
      description: "Learn about logging, listening, variables, conditionals, arrays & functions"
      categoryId: [4] 
    ,
      name: 'Slack Slash Command Handler'
      projectId: 51
      appId: 'a9e55c25-bf40-4162-b1b5-dc33047c0cdc'
      editorUrl: 'slash-command'
      likes: 14
      remixes: null
      description: "Respond to custom Slash Commands in Slack, using MongoDB for persistence"
      categoryId: [7,9]
    ,  
      name: 'Circles Bouncing Off Lines'
      projectId: 82
      appId: '0bbef086-c8da-44c3-a854-c1ea07b9347f'
      editorUrl: 'circles-bouncing-off-lines'
      likes: 9
      remixes: null
      description: "Learn how to calculate the movement of circles as they bounce off lines"
      users: [
        name: 'maryrosecook'
        avatar: 'https://avatars3.githubusercontent.com/u/2716?v=3&s=48'
      ]
      categoryId: [4] 
    ,
      name: 'App Authentication with Auth0'
      projectId: 53
      appId: '52926f2f-6fd3-428c-8846-a2b02b4d20d3'
      editorUrl: 'auth0'
      likes: 17
      remixes: null
      description: "Let Auth0 take care of how users authenticate with your app"
      categoryId: [3]
    ,
      name: 'Alexa Skill for Amazon Echo'
      projectId: 54
      appId: '681cc882-059d-4b05-a1f6-6cbc099cc79c'
      editorUrl: 'alexa-skill'
      likes: 17
      remixes: null
      description: "Ask Alexa for airport information using an airport code"
      categoryId: [7,8]
    ,
      name: 'Messenger Platform bot'
      projectId: 55
      appId: 'ca73ace5-3fff-4b8f-81c5-c64452145271'
      editorUrl: 'messenger-bot'
      likes: 9
      remixes: null
      description: "A Facebook Messenger Platform bot template"
      users: [
          name: 'fbsamples'
          avatar: 'https://avatars1.githubusercontent.com/u/1541324?v=3&s=48'
      ]      
      categoryId: [7]
    ,  
      name: 'Chewy'
      projectId: 95
      appId: 'a4c42aef-7c70-484b-ab24-8c344063a7c8'
      editorUrl: 'chewy'
      likes: 19
      remixes: null
      description: "Give Alexa the power of the Force with this Wookieepedia powered Skill"
      users: [
          name: 'stretchyboy'
          avatar: 'https://avatars1.githubusercontent.com/u/229326?v=3&s=48'
      ]
      categoryId: [7]       
    ,
      name: 'Grunt.js'
      projectId: 56
      appId: '68ea9bee-f345-4677-a916-f7c67004ae2d'
      editorUrl: 'grunt-js'
      likes: 7
      remixes: null
      description: "Example app that minifies a JS file with Uglify using Grunt"
      categoryId: [1]
    ,
      name: 'Parse Server'
      projectId: 57
      appId: 'bd480ea2-8578-4c05-8924-41328b922d16'
      editorUrl: 'parse-server'
      likes: 12
      remixes: null
      description: "An example Parse Server project using Express"
      users: [
          name: 'AndrewLane'
          avatar: 'https://avatars3.githubusercontent.com/u/479232?v=3&s=48'
      ]
      categoryId: [3]
    ,
      name: 'Parse Dashboard'
      projectId: 58
      appId: '7c96ce5b-c85b-41f9-b2fa-174f7d7475b8'
      editorUrl: 'parse-dashboard'
      likes: 11
      remixes: null
      description: "A sample project implementing Parse Dashboard"
      users: [
          name: 'AndrewLane'
          avatar: 'https://avatars3.githubusercontent.com/u/479232?v=3&s=48'
      ]
      categoryId: [5]
    ,
      name: 'Parse To-do App'
      projectId: 59
      appId: '26e3250c-12a8-4f2b-b122-04b217da32cb'
      editorUrl: 'parse-todo'
      likes: 9
      remixes: null
      description: "Example To-do app that uses Parse Server as a backend"
      categoryId: [5] 
    ,
      name: 'Node Twitter'
      projectId: 60
      appId: '519836db-41bb-43a8-b2d5-f6d9c55e314a'
      editorUrl: 'node-twitter'
      likes: 17
      remixes: null
      description: "Full Twitter clone app using Express and MongoDB"
      users: [
          name: 'vinitkumar'
          avatar: 'https://avatars3.githubusercontent.com/u/537678?v=3&s=48'
      ]
      categoryId: [6]
    ,  
      name: 'React.js'
      projectId: 61
      appId: '0539a08d-bcda-458e-8647-94813e4248b4'
      editorUrl: 'react-tutorial'
      likes: 4
      remixes: null
      description: "React comment box tutorial example"
      categoryId: [1]
    ,
      name: 'Firebase Database Quickstart'
      projectId: 63
      appId: 'fb2f9ebf-77b2-4f81-9f07-e5425f261f57'
      editorUrl: 'firebase-quickstart'
      likes: 12
      remixes: null
      description: "A simple social blog app using Firebase"
      categoryId: [3]
    ,
      name: 'HTML Slide Deck Presentation'
      projectId: 64
      appId: 'a787ebb0-b8ea-4a1f-8b6e-20d72cc6018d'
      editorUrl: 'slide-show'
      likes: 9
      remixes: null
      description: "Example presentation slide show using reveal.js"
      categoryId: [5]
    ,
      name: 'Salesforce Quickstart'
      projectId: 65
      appId: '3549cd9d-7768-447e-9d74-fa70370d6a1f'
      editorUrl: 'salesforce-quickstart'
      projectAvatarNeedsLegibility: true
      likes: 11
      remixes: null
      description: "Handles OAuth and commands using SOQL, Search and Chatter APIs"
      categoryId: [5,3] 
    ,
      name: 'MongoDB database persistence (sync)'
      projectId: 66
      appId: '732e6975-8c3a-44eb-8ac4-7932fd25440d'
      editorUrl: 'mongodb-sync'
      likes: 7
      remixes: null
      description: "A simple blog app using MongoDB database to store data"
      categoryId: [3]
    ,  
      name: 'MongoDB database persistence (async)'
      projectId: 67
      appId: '65100072-2918-465c-962a-65ccb765b6de'
      editorUrl: 'mongodb-async'
      likes: 4
      remixes: null
      description: "A simple blog app using MongoDB database to store data"
      categoryId: [3]   
    ,  
      name: 'SQLite3 with Sequelize'
      projectId: 68
      appId: '5dd56de5-79af-444e-a17e-bd60230962eb'
      editorUrl: 'sqlite3-db'
      likes: 4
      remixes: null
      description: "List app that demos a SQLite3 database using the Sequelize ORM"
      categoryId: [3]
    ,
      name: 'Learn Node.js with The Node Beginner'
      projectId: 7
      appId: '6c89fbec-c325-4618-9221-8da91296c6bb'
      editorUrl: 'node-beginner'
      likes: 14
      remixes: null
      description: "A beginner's guide to Node.js and JavaScript. Get started by selecting 'View Code'"
      users: [
        name: 'manuelkiessling'
        avatar: 'https://avatars3.githubusercontent.com/u/206592?v=3&s=48'
      ]
      categoryId: [4]
    ,  
      name: 'Learn JavaScript with Javascripting Workshopper'
      projectId: 26
      appId: 'd89cf37a-fef6-4855-b0dc-e029aa6c402f'
      editorUrl: 'javascripting'
      likes: 14
      remixes: null
      description: "18 exercises, covering the basics of JavaScript from variables to functions"
      categoryId: [4]     
    ,
      name: 'Slack Bot'
      projectId: 69
      appId: '095a1538-8c44-4b27-b0fe-936d194318c2'
      editorUrl: 'slack-bot'
      likes: 15
      remixes: null
      description: "Example Onboarding bot using Slack's Events API"
      categoryId: [7,9]
    ,
      name: 'Add to Alexa Flash Briefing'
      projectId: 70
      appId: 'ea79cf2c-9dce-4e84-ac29-3b6d1941c452'
      editorUrl: 'add-to-alexa'
      likes: 19
      remixes: null
      description: "Generate an Alexa Flash Briefing compatible JSON feed from submitted articles"
      categoryId: [7,8] 
    ,
      name: 'Multi Draw'
      projectId: 71
      appId: 'feca3b9d-2ddb-43ff-98fa-57abfe77506b'
      editorUrl: 'drawing-game'
      likes: 9
      remixes: null
      description: "Draw in real-time with multiple other people, and see what they're drawing too"
      categoryId: [2]      
    ,
      name: 'App Store Image Grabber'
      projectId: 72
      appId: 'd04c9a09-d45a-4aaa-8f33-a1e2772945d0'
      projectAvatarNeedsLegibility: true
      editorUrl: 'itunes-art'
      likes: 6
      remixes: null
      description: "Get the logos and screenshots from any app in the Apple iOS App Store"
      categoryId: [5]
    ,  
      name: 'NeDB'
      projectId: 73
      appId: '58fe13bd-0688-49f3-b562-c3b5817fc5d6'
      editorUrl: 'ne-db'
      likes: 7
      remixes: null
      description: "A list app that demos interacting with a NeDB database"
      categoryId: [3]
    ,  
      name: 'Nuxt.js'
      projectId: 74
      appId: '2d2e28d2-e17b-4934-a643-b1c5ba787a0b'
      editorUrl: 'nuxt-starter'
      likes: 9
      remixes: null
      description: "Editable live starter for nuxt.js"
      users: [
        name: 'nuxt'
        avatar: 'https://avatars3.githubusercontent.com/u/23360933?v=3&s=48'
      ]
      categoryId: [1] 
    ,  
      name: 'Vue.js HN'
      projectId: 75
      appId: 'a5a7b583-22ce-4f4f-a597-b5ec6a97c1ed'
      editorUrl: 'vue-hn'
      likes: 19
      remixes: null
      description: "Hacker News clone with server-side rendering, built w/ Vue 2.0, vue-router & vuex"
      users: [
        name: 'vuejs'
        avatar: 'https://avatars3.githubusercontent.com/u/6128107?v=3&s=48'
      ]
      categoryId: [6] 
    ,  
      name: 'Vue.js SSR'
      projectId: 76
      appId: '61b1736e-6fc1-47f5-addb-2a925099abc4'
      editorUrl: 'vue-ssr'
      likes: 9
      remixes: null
      description: "Vue 2.0 Server-side Rendering using only ES5 with no build step"
      users: [
        name: 'vuejs'
        avatar: 'https://avatars3.githubusercontent.com/u/6128107?v=3&s=48'
      ]
      categoryId: [1]
    ,  
      name: 'FogBugz.js'
      projectId: 77
      appId: 'b7e334f3-109b-4b92-bead-d995cbba5950'
      editorUrl: 'fogbugz-js'
      likes: 11
      remixes: null
      description: "A lightweight, promise-based wrapper around the FogBugz API"
      users: [
          name: 'bigdogwillfeed'
          avatar: 'https://avatars3.githubusercontent.com/u/4453639?v=3&s=48'
      ]
      categoryId: [3]
    ,  
      name: 'FogBugz Webhook Dashboard'
      projectId: 78
      appId: 'd5d11c11-c239-4b16-ae23-def8e2687c25'
      editorUrl: 'fogbugz-webhooks'
      likes: 7
      remixes: null
      description: "A simple server that handles incoming Webhooks delivered from FogBugz"
      categoryId: [5]  
    ,  
      name: 'Multiplayer Starter Game'
      projectId: 79
      appId: '6ef506f0-b790-454b-a9b8-f31347cc69f3'
      editorUrl: 'multiplayer-game'
      likes: 7
      remixes: null
      description: "Real-time multiplayer game using Node.js, Socket.io and HTML5 Canvas"
      users: [
        name: 'underscorediscovery'
        avatar: 'https://avatars3.githubusercontent.com/u/236374?v=3&s=48'
      ]
      categoryId: [2,3]
    ,  
      name: 'Pixelatize'
      projectId: 80
      appId: 'b76e18c8-01d4-48ce-9516-af13503c2a53'
      editorUrl: 'pixelatize'
      likes: 17
      remixes: null
      description: "Upload an image and '8-bit-ify' or pixelate or whatever you want to call it"
      users: [
        name: 'jennschiffer'
        avatar: 'https://avatars3.githubusercontent.com/u/341305?v=3&s=48'
      ]
      categoryId: [6] 
    ,  
      name: 'Space Invaders'
      projectId: 81
      appId: '57237357-0897-4eed-a5ec-b35c4432502c'
      editorUrl: 'space-invaders'
      likes: 12
      remixes: null
      description: "Learn about the game loop, collisions, input, drawing and sounds"
      users: [
        name: 'maryrosecook'
        avatar: 'https://avatars3.githubusercontent.com/u/2716?v=3&s=48'
      ]
      categoryId: [2] 
    ,  
      name: 'Voting'
      projectId: 85
      appId: '21ec6159-b62d-4397-9de2-4736d40aa18f'
      editorUrl: 'voting'
      likes: 12
      remixes: null
      description: "A simple polling and voting app"
      users: [
          name: 'hsubox'
          avatar: 'https://avatars3.githubusercontent.com/u/470813?v=3&s=48'
      ]
      categoryId: [5]
    ,  
      name: 'Mini Breakout'
      projectId: 87
      appId: '96ca67fd-d729-4a35-9edc-8ee01bdedb63'
      editorUrl: 'mini-breakout'
      likes: 12
      remixes: null
      description: "A simple Phaser-based Breakout clone"
      users: [
          name: 'anildash'
          avatar: 'https://avatars3.githubusercontent.com/u/84376?v=3&s=48'
      ]
      categoryId: [2] 
    ,  
      name: 'Browser Quest'
      projectId: 83
      appId: 'd76dfe3f-23bc-4a7e-9629-f110d2ffa268'
      editorUrl: 'browser-quest'
      likes: 21
      remixes: null
      description: "A HTML5/JavaScript massively multiplayer online role-playing game"
      users: [
          name: 'glecollinet'
          avatar: 'https://avatars3.githubusercontent.com/u/364962?v=3&s=48'
        ,
          name: 'sork'
          avatar: 'https://avatars3.githubusercontent.com/u/184017?v=3&s=48'
      ]
      categoryId: [2]
    ,  
      name: 'Blockspring'
      projectId: 88
      appId: '48d9a081-8ac6-497d-bc28-d3a32df56834'
      editorUrl: 'blockspring'
      projectAvatarNeedsLegibility: true      
      likes: 12
      remixes: null
      description: "Use Blockspring to easily get data from third-party APIs"
      categoryId: [3]
    ,
      name: 'Multiplayer Snake'
      projectId: 89
      appId: '454c12bf-21a2-485d-ab64-975d05525c16'
      editorUrl: 'nondescript-dog'
      likes: 15
      remixes: null
      description: "Play multiplayer Snake over websockets"
      users: [
          name: 'benoror'
          avatar: 'https://avatars0.githubusercontent.com/u/119117?v=3&s=48'
      ]
      categoryId: [2]
    ,
      name: 'Prototype with Material Design'
      projectId: 90
      appId: '9fe017c4-756e-4c58-b10b-e5412e32aefb'
      editorUrl: 'material-design'
      likes: 15
      remixes: null
      description: "A quick way to bootstrap a site or app with Material"
      users: [
          name: 'ghaida'
          avatar: 'https://avatars3.githubusercontent.com/u/342672?v=3&s=48'
      ]
      categoryId: [3]
    ,
      name: 'Coffee Talks'
      projectId: 91
      appId: '92d725da-5ec6-467d-959f-79cf20b8b93c'
      editorUrl: 'coffee-talks'
      likes: 21
      remixes: null
      description: "Heartfelt dev talks for humans, using Airtable as the database"
      users: [
          name: 'rosamcgee'
          avatar: 'https://avatars0.githubusercontent.com/u/2496274?v=3&s=48'
        ,
          name: 'pketh'
          avatar: 'https://avatars2.githubusercontent.com/u/877072?v=3&s=48'
      ]
      categoryId: [6]
    ,
      name: 'Contentful Command Slack Bot'
      projectId: 92
      appId: '0e7166c0-de2d-4965-8448-0e932e9f7efa'
      editorUrl: 'impossible-salmon'
      likes: 15
      remixes: null
      description: "A Slack slash command handler which will help you to quickly access and create data stored in Contentful"
      users: [
          name: 'stefanjudis'
          avatar: 'https://avatars1.githubusercontent.com/u/962099?v=3&s=48'
      ]
      categoryId: [7,9]
    ,
      name: 'Wordpress Slack Slash Command'
      projectId: 94
      appId: '1a511228-1f09-429c-a2d2-4a3e5ca7d07d'
      editorUrl: 'peek-at-posts'
      likes: 9
      remixes: null
      description: "Slack slash command to peek at the last 3 posts on a WordPress site"
      users: [
          name: 'tharsheblows'
          avatar: 'https://avatars1.githubusercontent.com/u/1530368?v=3&s=48'
      ]
      categoryId: [7,9]
    ,
      name: 'Botkit Starter Kit for Slack'
      projectId: 96
      appId: '12834ffd-d5ed-423a-b486-9f297f5cd04f'
      editorUrl: 'botkit-slack'
      likes: 13
      remixes: null
      description: "Starter kit for creating a Botkit-powered Slack app"
      users: [
          name: 'howdyai'
          avatar: 'https://avatars1.githubusercontent.com/u/16260958?v=3&s=48'
      ]
      categoryId: [7,9]
    ,
      name: 'Multiple IFTTT Triggers'
      projectId: 97
      appId: '4761356a-9369-4e79-9d1e-a8306e8c00b5'
      editorUrl: 'multi-ifttt-triggers'
      likes: 13
      remixes: null
      description: "Trigger multiple actions from a single command"
      categoryId: [8]
    ,
      name: 'Conditional IFTTT Triggers'
      projectId: 98
      appId: '0e1a6c28-f95f-4920-a691-27697b572b24'
      editorUrl: 'conditional-ifttt-triggers'
      likes: 11
      remixes: null
      description: "Trigger one or more IFTTT services when certain conditions are met"
      categoryId: [8]
    ,
      name: 'Zapier Webhooks'
      projectId: 99
      appId: '1545abd9-68a2-4c4a-937b-8ee19ac2aa3e'
      editorUrl: 'zapier-webhooks'
      likes: 14
      remixes: null
      description: "Send and receive webhooks to and from Zapier"
      categoryId: [8,5]
    ,
      name: 'Google Home Action'
      projectId: 100
      appId: 'af1e91ec-2f6d-4a37-82cb-21c8bd289460'
      editorUrl: 'google-home'
      likes: 12
      remixes: null
      description: "Which is better, Daddy or Chips? Your Google Home knows"
      categoryId: [8,7]
    ,
      name: 'Particle JS API'
      projectId: 101
      appId: 'cfc5bdd8-35cf-4f95-9ea0-4d637739ac6d'
      editorUrl: 'particle-api'
      likes: 10
      remixes: null
      description: "Control an LED on a Particle device using the Particle JS API"
      categoryId: [8,3]
    ,
      name: 'littleBits API'
      projectId: 102
      appId: '9f67720d-ad82-43b1-a7a5-2edc81e35b48'
      editorUrl: 'littlebits-api'
      likes: 16
      remixes: null
      description: "Control your CloudBit device using the littleBits API"
      categoryId: [8,3]
    ,
      name: 'Temboo'
      projectId: 103
      appId: 'cbd095f2-e0a5-4f7d-8113-2fc54d79b1ea'
      editorUrl: 'temboo'
      likes: 10
      remixes: null
      description: "Temboo example app that uses their Node.js SDK"
      categoryId: [8] 
    ,
      name: 'CoffeeScript'
      projectId: 104
      appId: '5d5360ae-ed85-4a92-b60e-421acb2da08a'
      editorUrl: 'coffee-script-base'
      likes: 11
      remixes: null
      description: "CoffeeScript backend that compiles clientside code with CoffeeScript using Browserify middleware"
      users: [
          name: 'STRd6'
          avatar: 'https://avatars2.githubusercontent.com/u/18894?v=3&s=48'
      ]      
      categoryId: [3]
    ,
      name: 'Super Bowl Squares'
      projectId: 105
      appId: '55dbb2a4-94d9-434f-9dcc-1432c975de1c'
      editorUrl: 'superbowl-squares'
      likes: 21
      remixes: null
      description: "Start your own Football Squares pool with friends and colleagues"    
      categoryId: [10] 
    ,
      name: 'Big Game Bingo'
      projectId: 106
      appId: '902cbaf0-e4e9-47c0-80b2-fe7ef583d679'
      editorUrl: 'big-game-bingo'
      likes: 19
      remixes: null
      description: "Watch the big game for the ads? Embrace the clichés and play Big Game Bingo!"     
      categoryId: [10] 
    ,
      name: 'Quarterback Quiz'
      projectId: 107
      appId: '56e665e5-e0a8-46c8-9476-8d9b731117dd'
      editorUrl: 'quarterback-quiz'
      likes: 15
      remixes: null
      description: "Test your Football knowledge with this Quarterback quiz"     
      categoryId: [10] 
    ,
      name: 'LiveChat Agent App'
      projectId: 108
      appId: '514be323-4add-49c4-806d-e7f8fc27e933'
      editorUrl: 'livechat-sample-agent-app'
      likes: 15
      remixes: null
      description: "Sample app demonstrating how to build a LiveChat App Extension"
      users: [
          name: 'livechat'
          avatar: 'https://avatars2.githubusercontent.com/u/1615526?v=3&s=48'
      ]      
      categoryId: [3,5] 
    ,
      name: 'Hackathon Starter'
      projectId: 109
      appId: '4a351a6e-f316-495c-b107-8b91ade9746e'
      editorUrl: 'hackathon-starter'
      likes: 15
      remixes: null
      description: "A boilerplate for Node.js web applications"
      users: [
          name: 'sahat'
          avatar: 'https://avatars2.githubusercontent.com/u/544954?v=3&s=48'
      ]      
      categoryId: [3]     
  ]
