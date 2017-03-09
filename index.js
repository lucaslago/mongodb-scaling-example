const express = require('express');
const mongoose = require('mongoose');
const db = mongoose.connection;
const replicasetUri = 'mongodb://mongodb1:27017,mongodb2:27018,mongodb3:27019/test?replicaSet=rs&readPreference=primaryPreferred';

mongoose.set('debug', true);
mongoose.Promise = global.Promise;
mongoose.connect(replicasetUri);

const kittySchema = mongoose.Schema({
  name: String
});
const Kitten = mongoose.model('Kitten', kittySchema);


db.on('error', console.error.bind(console, 'connection error'));
db.once('open', () => { 

  const app = express();

  app.post('/kitten', (req, res, next) => {
    console.log('Creating kitten...');
    const kitten = new Kitten({name: 'a kitten :)'});
    kitten.save((err, kitten) => {
      if(err) next(err);
      console.log(`new Kitten saved: ${kitten}`);
    });
    return res.json('ok');
  });

  app.get('/kitten', (req, res, next) => {
    const secondary = req.query.secondary;
    if(secondary) {
      console.log('Reading all kittens from secondary node');
      Kitten
        .find({})
        .read('secondary')
        .then(kittens => {
          console.log(kittens);
          return res.json(kittens);
        })
        .catch(err => next(err));
    } else {
      console.log('Reading all kittens from primary node');
      Kitten
        .find({})
        .read('primary')
        .then(kittens => {
          console.log(kittens);
          return res.json(kittens);
        })
        .catch(err => next(err));
    }
  });

  app.listen(8080, () => console.log('listening on 8080'));

});


