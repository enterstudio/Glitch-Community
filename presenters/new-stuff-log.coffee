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

            ![Delete using the project's dropdown list](https://cdn.glitch.com/03736932-82dc-40e8-8dc7-93330c933143%2Fnew-stuff-delete.png?1518549490386)

            ![Undelete projects using the new controls at the bottom of your profile page](https://cdn.glitch.com/03736932-82dc-40e8-8dc7-93330c933143%2Fnew-stuff-undelete.png?1518549501633)

          """
      ]


  return self
