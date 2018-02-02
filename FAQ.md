FAQ
---

_Every FAQ was once just a single question..._

### I remixed this site... how do I log in?

There's a peculiarity around Oauth logins, since the providers expect the site to have a different domain than what your remix has.  To log in to your new remixed site:

1. In a new browser tab, visit [Glitch.com](https://glitch.com) and log in if you aren't already.

2. Open up your browser's [Developer Tools](https://webmasters.stackexchange.com/a/77337/2628) and run this command in the console: `window.localStorage.cachedUser`.  Highlight and copy the big JSON blob that it prints out.
  
3. Now, back in your remixed community site, click on the 'show' button to view your running app.  Open the developer tools again and this time type in
  
  ```
  window.localStorage.cachedUser = ``[Paste Here]``
  ```
  
replacing the `[Paste Here]` with your copied JSON blob from the other tab. Hit enter, refresh the page, and you're logged in! 

Depending on what browser you're using, there might be a finnicky spacing issue that's preventing the JSON from coming through cleanly.  If that's the case, it can be helpful to copy just the inner JSON object, and then load the object into the page using 
```
window.localStorage.cachedUser = JSON.stringify(``[Paste JSON Here]``)
```