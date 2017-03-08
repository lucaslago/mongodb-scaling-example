const express = require('express');
const mongoose = require('mongoose');

mongoose.connect('mongodb://mongodb1:27017');

const app = express();

app.get('/', (req, res) => {
  console.log('aee root');
  res.json('ok');
});

app.listen(8080, () => console.log('listening on 8080'));

