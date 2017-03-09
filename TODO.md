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
- [x] anon avatars display
- [x] using anonface and user.color (now given from api)
- [x] anon user recent projects
- [x] sign in user header
- [x] signed in user recent projects
- [x] add users to URL based project overlay
- [x] port category pages
- [x] OVERLAY: convert overlay from qs to /~project-name (with no subpage name)
- [x] OVERLAY: opening an overlay updates url with ~ link (even on subpages)
- [x] OVERLAY: add project avatar img to overlay somewhere [blocked by api]
- [x] OVERLAY: users work in qs/direct link based overlays
- [x] 404 page
- [x] CURATED_MODEL: manually merge in latest prod model/curated of projects
- [x] CURATED_MODEL: ?remove unused avatarNeedsBackgorund/legibility bool from curated
- [x] collection cats, to collections (ie art gaallery, event thing etc)
- [x] CURATED_MODEL: move partner categories into partners team beta. https://docs.google.com/document/d/1G58e3FqUXqaXPRKwG5Y9w3hw5gbLrIc2p90mX5S-3hk/edit#heading=h.huf5k7n5e5u8
- [x] search page rendered from api response (projects/search?q=lsdkjf and users/search?..)
- [x] BUG in search , where clicking project, hitting reload, 404s
- [x] update title tag in pages (see prod, searches, categories, 404 👻 Page Not Found) set from `client.coffee`?
- [x] social meta tags/imgs in index.html



- [ ] pattern background instead of table for default .profile. maybe something glitchy, something earthboundy/cafe-club? tiling


- [ ] PERF: client.js size and perf improvemnts (shouldn't be pulling down 4mb for application)
- [ ] PERF: compress css
- [ ] PERF: sourcemaps
- [ ] is the webfont redownloading each time?

- [ ] ??port image links to the new project (because will be fully replacing the current community)

- [x] AUTH: add fb/gh sign in strategies in popover (inside header)
- [x] AUTH: finish multi sign in oauth/and new user localstorage.cacheduser like editor
- [ ] AUTH: pass that new user to editor (test)

## phase 2

- [ ] getting recent projects , from teh recent files ls data is kinda flakey, maybe should move that to a user.getUser info api call instead
- [ ] PARTNER page: beta for profile page: replace special partner category page + formatting with profile page beta (/@slack)
- [ ] get `application` methods into console, like editor
- [ ] hands raised mockup: show some projects that currently need help
- [ ] @PROFILE: profile pages https://fogcreek.wake.com/474
- [ ] @PROFILE: profile hover pop https://fogcreek.wake.com/476
- [ ] add accessibility (aria, etc.)
- [ ] add user search ui bits

- [ ] GA: event tracking 


## phase 3

- [ ] move curation data to a db or service (airtable/sheets + caching seems okay)

### phase 4

- [ ] unit tests (application, presenter methods)

### phase 5 polish

- [ ] quick search (based on results list), with 'all results' as the bottom option

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
