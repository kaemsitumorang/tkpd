// Reguire modules
var express = require('express');
var http_auth = require('express-http-auth');

// Create app
var app = express();

// Require http auth
app.use(http_auth.realm('PDP'));
app.use(function(req, res, next){
  if (req.username == 'discovery' && req.password == 'pdp') {
    next();
  } else {
    res.sendStatus(403);
  }
});

// Serve static files as default
app.get('/*', express.static(__dirname + '/pdp_optimize.framer'));

// Listen for both Heroku and local. Access locally as http://localhost:3333
app.listen(process.env.PORT || 3333);
