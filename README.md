Jadelet Base
=================

A client-side app framework with databinding between your models and views.

Jadelet is a flavor of [Hamlet](http://hamlet.coffee). We use Jadelet to make the [Gomix editor](https://gomix.com/#!/project/jadelet-base) and the [community site](http://gomix.com/community)


         (  )   (   )  )
          ) (   )  (  (
          ( )  (    ) )
          _____________
         <▓▓▓▓▓▓▓▓▓▓▓▓▓> ___
         |             |/ _ \
         |=============  | | |
         |xoxoxoxoxoxox  |_| |
      ___|=============|\___/  
     /    \___________/    \
     \_____________________/


Getting Started
-----------------

- your app starts at `server.coffee`
- add frameworks and packages in `package.json`
- safely store app secrets in `.env`
- `client.coffee` is compiled and served as /client.js
- view templates start at `templates/hello.jadelet`
- stylus files like `public/style.styl` is compiled and served directly as `public/style.css`
- Files in `public/` are served directly
- drag in `assets`, like images or music, to add them to your project
