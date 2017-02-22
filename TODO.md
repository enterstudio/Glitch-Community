# TODO

## phase 1

- [x] port styles
- [x] port home view
  - [x] header
  - [x] port curation data (formerly model, now 'curated')
  - [x] featured
  - [x] projects/cats
  - [x] footer
- [ ] port overlays (project)
- [ ] port other pages
- [ ] search page rendered from api response

- [ ] figure out routes (`/community` and `/` go to the same place)
- [ ] 404 page
- [ ] create a trackEvent GA abstraction (use editor gtm w category? mirror event_tracking.coffee)
- [ ] add accessibility (aria, etc.)
- [ ] port image links to the new project (because will be fully replacing the current community)

- [ ] social meta tags/imgs in index.html

## phase 2

- [ ] show some projects that currently need help
- [ ] user detection ls
- [ ] start work on your-profile section and profile hover pop..
- [ ] simplify curation data requirements based on api and gh calls

## phase 3

- [ ] move curation data to a db or service (airtable/sheets + caching seems okay)

### phase 4 teams

- [ ] unit tests (application, presenter methods)

---------------------

# QA

- [ ] screenreader usable?
- [ ] urls as expected?

----------------
