# Glitch Community Projects

Discover new reasons to code, remix cool and helpful projects made with Glitch.

Philosophically, a little bit `Youtube`, some `Spotify`, with a sprinkle of `app store`.

Getting Started
-----------------

#### Remix this project

It should come straight to life.

There's a peculiarity around Oauth logins, since the providers expect the site to have a different domain than what your remix has.  To log in to your new remixed site,

  In a new browser tab, visit Glitch.com and log in if you aren't already.  Open up your browser's [Developer Tools](https://webmasters.stackexchange.com/a/77337/2628) and run this command in the console: `window.localStorage.cachedUser`.  Highlight and copy the big JSON blob that it prints out.
  
  Now, in t your remixed community site
First, log in on glitch.com.  Now open up your browser tools and 
  grab the 'cachedUser' data from local storage.  (In Chrome, you'll find this under the 'application' tab.)  Paste that data into your localstorage
  data in your remix, refresh the page, and now you're logged in!


Architecture: 

- the app starts at `server.coffee`
- `client.coffee` is compiled and served as /client.js
- view templates start at `templates/hello.jadelet`
- stylus files like `public/style.styl` is compiled and served directly as `public/style.css`
- Files in `public/` are served directly
- drag in `assets`, like images or music, to add them to your project

application models -> presenter -> DOM

```
  ___     ___      ___
 {o,o}   {o.o}    {o,o}
 |)__)   |)_(|    (__(|
--"-"-----"-"------"-"--
O RLY?  YA RLY   NO WAI!
```

Contributing
------------

Please read [CONTRIBUTING.md](https://glitch.com/edit/#!/community?path=CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.



Why is this in [Jadelet](https://jadelet.com/)?
-----------------------
- The Glitch editor is also written in jadelet, so it reduces switching cost
- A nice Models, Presenters and Templates architecture
- Can render views based on cached localstorage values, then update them with API based values

FAQ
---
- _I remixed this site... how do I log in?_

  First, log in on glitch.com.  Now open up your browser tools and 
  grab the 'cachedUser' data from local storage.  (In Chrome, you'll find this under the 'application' tab.)  Paste that data into your localstorage
  data in your remix, refresh the page, and now you're logged in!
