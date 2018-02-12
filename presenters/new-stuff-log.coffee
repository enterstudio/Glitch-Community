"use strict"

# 🐈

module.exports = () ->
  self =

    # equal to most newest update.id
    totalUpdates: -> 
      self.updates()[0].id

    # prepend new updates
    updates: ->
      [
        id: 3
        title: "Sharing is Caring"
        body:
          """
            Come in, get comfy, have a seat by the fire. New Glitch news is lit.

            ## Embeds

            You can now embed your Glitch project on your own site. We think it’s a great way to show off your work, teach coding, and make documentation more interactive and engaging.

            ![glitch embed example](https://cdn.glitch.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2Fembed-example.png?1512061993545)

            You can make embeds in `Share → Advanced Sharing`

            ## Also,

            - `Project → Advanced Options → Public/Private` Based on feedback, the Public/Private project toggle has moved back to it’s original home.
            - `Share → Advanced Sharing` also includes a code snippet for a View Source button that you can copy and paste into your own project.
            - ✍️🎤 You can now just start typing to remix someone else’s project.
          """
      ,
        id: 2
        title: "You Own Little Space on Glitch"
        body:
          """
            Now you can express yourself and the projects you’re most proud of on your very own user page.  Yes, we made it just for you. And your friends. And maybe even your favorite bands. Whoops, we made MySpace – but for code.

            Just like MySpace, we hope you'll go nuts with cover art and project pinning by visiting `your profile` from [glitch.com](https://glitch.com)

            ![dan reeves' user page](https://cdn.glitch.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2Fdan-new-stuff-log.png?1504893071965)

            p.s. here's [Dan's](https://glitch.com/@danreeves). More details [on Medium](https://medium.com/glitch/your-own-little-space-on-glitch-865b5cfebb7f)
          """
      ,
        id: 1
        title: "You're cordially invited to the $BASH"
        body:
          """
            You can now Open the Console 📟 for your project by going to the advanced options menu.

            Peek at spirits with `ls -a`, find juicy tidbits by `grep`ing yourself, `git` good, measure your rising blood pressure with `hg`. etc.

            That said, if terminals and command lines make you bored or grimace-y, you definitely don't need it to use Glitch.

            XOXO

            Also, we moved the project privacy toggle to the Share menu, to keep things contextually connected.

          """
      ]


  return self
