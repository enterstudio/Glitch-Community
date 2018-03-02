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
            You can now delete _and undelete_ projects. 🎉

            Tidy up your profile page without fear of regret.
            There's a new "Delete This" button on your project tiles that'll let you clean up 
            your old experiments and help you present a healthier, more active looking profile page. 🥦

            ![Delete using the project's dropdown list](https://cdn.glitch.com/03736932-82dc-40e8-8dc7-93330c933143%2Fnew-stuff-delete.png?1518549490386)

            All of your deleted projects are listed for you at the bottom of your profile page,
            and you can restore them to life with just one click.

            ![Undelete projects using the new controls at the bottom of your profile page](https://cdn.glitch.com/03736932-82dc-40e8-8dc7-93330c933143%2Fnew-stuff-undelete.png?1518552423035)

            No forever-💔 here, every project has a second chance.
          """
      ]


  return self
