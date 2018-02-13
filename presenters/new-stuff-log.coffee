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
###        
        id: 3
        title: "Contributions Welcome"
        body:
          """
            Our contribution guidelines are live!

            Check out [CONTRIBUTING.md](https://glitch.com/edit/#!/community?path=CONTRIBUTING.md) to see how you can join us to help build the very fabric of the Glitch community site.
          """
      ,
        id: 2
        title: "Deleted, but not forgotten"
        body:
          """
            You can now delete and undelete projects from your profile page.

            Check out [CONTRIBUTING.md](https://glitch.com/edit/#!/community?path=CONTRIBUTING.md) to see how you can join us to help build the very fabric of the Glitch community site.
          """
      ,
###
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
