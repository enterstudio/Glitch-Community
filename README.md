# Glitch Community Projects

Discover new reasons to code, remix cool and helpful projects made with Glitch.

Philosophically, a little bit `app store`, some `Spotify`, and a little bit `Youtube`.

Getting Started
-----------------

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

TEMP: why rewrite in jadelet:
- similar to editor reduces switching cost
- more maintainable views
- unit testable
- can render views based on user LS values more conveniently
