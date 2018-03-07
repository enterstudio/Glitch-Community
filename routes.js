let API_URL, APP_URL, CDN_URL, EDITOR_URL, FACEBOOK_CLIENT_ID, GITHUB_CLIENT_ID;
const fs = require("fs");
const axios = require("axios");
const util = require("util");
const express = require('express');
const CACHE_INTERVAL = 1000 * 60 * 30; // 30 minutes

const fs_writeFile = util.promisify(fs.writeFile);

if (process.env.RUNNING_ON === 'staging') {
  APP_URL = 'https://staging.glitch.com';
  API_URL = 'https://api.staging.glitch.com/';
  EDITOR_URL = 'https://staging.glitch.com/edit/';
  CDN_URL = 'https://cdn.staging.glitch.com';
  GITHUB_CLIENT_ID = "65efbd87382354ca25e7";
  FACEBOOK_CLIENT_ID = "1858825521057112";
} else {
  APP_URL = 'https://glitch.com';
  API_URL = 'https://api.glitch.com/';
  EDITOR_URL = 'https://glitch.com/edit/';
  CDN_URL = 'https://cdn.glitch.com';
  GITHUB_CLIENT_ID = "b4cb743ed07e20abf0b2";
  FACEBOOK_CLIENT_ID = "660180164153542";
}

const updateCache = async type => {
  let response = await axios.get(`${API_URL}${type}`, {
    transformResponse: (data) => data // Override the default object transform
  });
  let json = response.data;
  
  try {
    let fileContents = `module.exports = ${json}`
    await fs_writeFile(`./src/cache/${type}.js`, fileContents);
    console.log(`☂️ ${type} re-cached`);
  } catch (error) {
    console.error("☔️", error);
  }
};

const updateCaches = async () => {
  await updateCache('categories');
  await updateCache('teams');
  console.log("☂️ cache updated");
};

updateCaches();
setInterval(updateCaches, CACHE_INTERVAL);

module.exports = function() {
  
  const app = express.Router();
  
  // CORS - Allow pages from any domain to make requests to our API
  app.use(function(request, response, next) {
    response.header("Access-Control-Allow-Origin", "*");
    response.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    return next();
  });
    
  app.use(express.static('public'));

  // Log all requests for diagnostics
  app.use(function(request, response, next) {
    console.log(request.method, request.originalUrl, request.body);
    return next();
  });

  app.post('/update-caches', (request, response) =>
    updateCaches()
    .then(() => response.sendStatus(200))
  );

  return app.get('*', (request, response) =>
    response.render('index', {
      route: request.path,
      baseUrl: request.baseUrl,
      clientJs: 'client-bundle.js',
      API_URL,
      APP_URL,
      EDITOR_URL,
      CDN_URL,
      GITHUB_CLIENT_ID,
      FACEBOOK_CLIENT_ID
    }
    )
  );
};
