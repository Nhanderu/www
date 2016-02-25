'use strict';

/*

/source/configuration/server
Server Configuration module!

Defines all the variables and confiration of the application before it runs.
Exports the configurated application.
 */
var app, http, ip, koa, log, port, route, run;

koa = require('koa');

http = require('http');

route = require('./router');

log = require('./logger');

app = koa();

port = app.context.port = process.env.OPENSHIFT_NODEJS_PORT || 8080;

ip = app.context.ipAddr = process.env.OPENSHIFT_NODEJS_IP || '127.0.0.1';

route(app);

log.set(app);

run = function(p) {
  var fn;
  p = p || port;
  fn = function() {
    log.start(ip, p);
    return app.callback();
  };
  return http.createServer(fn()).listen(p);
};

module.exports = run;
