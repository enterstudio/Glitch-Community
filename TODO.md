# TODO

## phase 1

- [x] port styles
- [x] port home view
  - [x] header
  - [x] port curation data (formerly model, now 'curated')
  - [x] featured
  - [-] projects/cats
  - [ ] footer
- [ ] port other pages
- [ ] port search function
- [ ] port overlays (project)

- [ ] figure out routes (`/community` and `/` go to the same place)
- [ ] 404 page
- [ ] create a trackEvent GA abstraction (use editor gtm w category? mirror event_tracking.coffee)
- [ ] add accessibility (aria, etc.)
- [ ] port image links to the new project (because will be fully replacing the current community)

## phase 2

- [ ] user detection ls
- [ ] start work on your-profile section and profile hover pop..
- [ ] simplify curation data requirements based on api and gh calls

## phase 3

- [ ] move curation data to a db or service (airtable + caching seems okay)

---------------------

# QA

- [ ] screenreader usable?
- [ ] urls as expected?
