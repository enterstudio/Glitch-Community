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
        id: 2
        title: "Contributions Welcome"
        body:
          """
            Our contribution guidelines are live!

            Check out [CONTRIBUTING.md](https://glitch.com/edit/#!/community?path=CONTRIBUTING.md) to see how you can join us to help build the very fabric of the Glitch community site.
          """
      ,
###
        id: 1
        title: "Deleted, but not forgotten"
        body:
          """
            You can now delete and undelete projects from your profile page!

            Check out [CONTRIBUTING.md](https://glitch.com/edit/#!/community?path=CONTRIBUTING.md) to see how you can join us to help build the very fabric of the Glitch community site.
          """
      ]


  return self
