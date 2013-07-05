var express = require('express');
var app = express();

app.use(express.logger());

app.get('/', function(req, res) {
  res.send('<h1>Hello world!</h1>');
});

app.listen(8001);
