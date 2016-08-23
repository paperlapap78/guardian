#!/usr/bin/env node

require('coffee-script/register');

var app = require('./lib/app');

var throng = require('throng');

throng(start, {
  workers: 1,
  lifetime: Infinity
});

function start() {
  return app.listen(3000, function() {
    app.emit('started');
    console.log('App server listening at: %s:%s', this.address().address,
      this.address().port);
  });
};