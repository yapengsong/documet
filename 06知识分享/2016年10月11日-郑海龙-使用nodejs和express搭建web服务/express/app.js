/**
 * Created by ZHL on 2016/6/27.
 */
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

var view = require('./routes/view');
var user = require('./routes/user');

var app = express();

app.set('views', path.join(__dirname, 'view'));
app.set('view engine', 'jade');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use('/public', express.static(__dirname + '/public'));
app.use(view);
app.use('/api/user', user);

module.exports = app;