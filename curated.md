# "curated" refactor changes

the gist of this refactor is to, instead of having one curated.coffee file to hold literally every community site project, have an organized "curated" directory that holds separate files for featured, partner, and project category items. this is going to be invaluable as we move forward with better curating community projects and also working with partners!

## how to add things

the way items are added have not changed much - it's just where they are added, really.

to create a category for the homepage, add a category object to `curated/categories.coffee`. its `curatedName` property defines the file name within `curated/categories` where its projects are listed. for example, to add the category "cool category", one would add:

```
name: 'Cool Category'
url: 'cool-category'
curatedName: 'cool-category'
img: cool
color: "#FCF3AF"
description: "Just some cool stuff, buddy"
background: "rgba(252, 243, 174, #{backgroundOpacity})"
```

and then you'd create a file `curated/categories/cool-category.coffee` and list all the projects that belong to this category in there. The `img` variable should be defined at the top of `categories.coffee` as well. basically, it's important to know that `curatedName` and the filename within the `curated/projects` folder need to be identical, as it's how those projects are collected on page load :D

it's a similar process for adding collections and partners, just look for their respective .coffee files and directories.

## "changelog"

### items removed
* curated.coffee
* curated-archive.txt

### items added
* "curated" directory
* archives.txt (copied from the deleted curated-archive.txt)
* categories.coffee (lists core homepage categories)
* collections.coffee (lists collections)
* featured.coffee (featured projects)
* partners.coffee (lists partner pages)
* projects.coffee (lists all the project groups, categories collections & partners)
* "curated/categories" directory
* curated/categories/*.coffee files for each category
* "curated/partners" directory
* curated/partners/*.coffee files for each partner page
* "curated/collections" directory
* curated/collections/*.coffee files for each collection

### items updated to adapt to above changes
* application.coffee
  - updated projectsInCategory(), projectsInSelectedCategory(), getCategoryFromUrl(), categoryUrls()
  - added allProjects() just for fun/just in case :)
* presenters/category-page.coffee
* presenters/category.coffee

for questions, see j$ :)