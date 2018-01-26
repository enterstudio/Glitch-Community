# Glitch Community Projects

Discover new reasons to code, remix cool and helpful projects made with Glitch.

Philosophically, a little bit `Youtube`, some `Spotify`, with a sprinkle of `app store`.

Getting Started
-----------------

[Contribution Guidelines and Process](https://docs.google.com/document/d/11xNX1SnAfnhUJZcE6jx_ic4QQUGtThv1CpvBprtB4Wo/edit)

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

Why is this in [Jadelet](https://jadelet.com/)?
-----------------------
- The Glitch editor is also written in jadelet, so it reduces switching cost
- A nice Models, Presenters and Templates architecture
- Unit testable (eventually!)
- Can render views based on cached localstorage values, then update them with API based values

FAQ
---
- _I remixed this site... how do I log in?_

  First, log in on glitch.com.  Now open up your browser tools and 
  grab the 'cachedUser' data from local storage.  (In Chrome, you'll find this under the 'application' tab.)  Paste that data into your localstorage
  data in your remix, refresh the page, and now you're logged in!
