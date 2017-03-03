# TODO

## phase 1

- [x] port styles
- [x] port home view
  - [x] header
  - [x] port curation data (formerly model, now 'curated')
  - [x] featured
  - [x] projects/cats
  - [x] footer
- [x] port overlays (project)
- [x] post route to get a list of curated projects
- [x] move overlay methods to overlay presenter
- [x] BUG: 'overlay template' leaking/overrendering
- [x] figure out routes (`/community` and `/` go to the same place)
- [x] create a trackEvent GA abstraction (use editor gtm w category? mirror event_tracking.coffee)
- [x] replace ga track-events, w one global onclick handler which logs things w data ga tags 
- [x] modularize tracking
- [x] opening overlay updates url bar
- [x] if query string containing project name, open project overlay to that name (linkable lightboxes)

- [x] add users to project overlay 
- [ ] add users to URL based project overlay

- [ ] anon user recent projects
- [ ] signed in user recent projects

- [ ] search page rendered from api response (projects/search?q=lsdkjf and users/search?..)

- [x] port category pages
- [ ] 404 page
- [ ] social meta tags/imgs in index.html

- [ ] BUG qs permalinks should work from subpages too https://luck-beam-comm2.gomix.me/games?project=pong-solo

### auth stuff
- [x] add fb/gh sign in strategies in popover (inside header)
- [ ] finish multi sign in oauth/and new user localstorage.cacheduser like editor
- [ ] pass that new user to editor

### curated model
- [ ] manually merge in latest prod model/curated of projects
- [ ] ?remove unused avatarNeedsBackgorund/legibility bool from curated
- [ ] move partner categories into a seperate thing called collectinos. remove listedonhomepage bool and check. https://docs.google.com/document/d/1G58e3FqUXqaXPRKwG5Y9w3hw5gbLrIc2p90mX5S-3hk/edit#heading=h.huf5k7n5e5u8

### partner stuff
- [ ] team beta?: add special partner category page formatting (see old snippet in todo) . `team/slack`


- [ ] ??port image links to the new project (because will be fully replacing the current community)




## phase 2

- [ ] add accessibility (aria, etc.)
- [ ] GA: event tracking 
- [ ] get `application` methods into console, like editor
- [ ] browserify stuff
- [ ] hands raised mockup: show some projects that currently need help
- [ ] user detection ls
- [ ] start work on your-profile section and profile hover pop..
- [ ] simplify curation data requirements based on api and gh calls
- [ ] quick search (based on results list), with 'all results' as the bottom option

## phase 3

- [ ] move curation data to a db or service (airtable/sheets + caching seems okay)

### phase 4 teams

- [ ] unit tests (application, presenter methods)

---------------------

# QA

- [ ] screenreader usable?
- [ ] urls as expected?

----------------


# changePage = (newPage) ->
#   content = document.querySelector('content')
#   content.remove()
#   content.appendChild newPage


special logic for partnerCollection true
            if category.partnerCollection
              if category.docsLink
                span.extraLinks
                  a(href=category.docsLink target="_blank")
                    img.projectAvatar.first(src="https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Fbook.svg")
                    | Docs
              if category.blogLink
                span.extraLinks
                  a(href=category.blogLink target="_blank")
                    img.projectAvatar(src="https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Fpencil-square-o.svg")
                    | Dev Blog
              if category.githubLink
                span.extraLinks
                  a(href=category.githubLink target="_blank")
                    img.projectAvatar(src="https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Fgithub.svg")
                    | GitHub
              if category.twitterLink
                span.extraLinks
                  a(href=category.twitterLink target="_blank")
                    img.projectAvatar(src="https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Ftwitter.svg")
                    | Twitter  
