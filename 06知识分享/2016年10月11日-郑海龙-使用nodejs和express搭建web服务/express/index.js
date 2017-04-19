#!/usr/bin/env node

var app = require('./app');
var debug = require('debug')('app');
var http = require('http');

var port = normalizePort(process.env.PORT || '3030');
app.set('port', port);

var server = http.createServer(app);

server.listen(port,function () {
  debug('Listening on port ' + port);
});

/**
 * Normalize a port into a number, string, or false.
 */

function normalizePort(val) {
  var port = parseInt(val, 10);

  if (isNaN(port)) {
    // named pipe
    return val;
  }

  if (port >= 0) {
    // port number
    return port;
  }

  return false;
}