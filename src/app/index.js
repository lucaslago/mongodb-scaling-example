const harvest = require('harvesterjs');
const Joi = require('joi');

const config = require('../../config');

const options = {
  adapter: 'mongodb',
  connectionString: config.mongoUrl,
  db: 'blog',
  inflect: true,
  oplogConnectionString: config.oplogUrl
};

// define 2 resources
const harvestApp = harvest(options)
  .resource('kitten', {
    name: Joi.string()
  })
  .onChange({
    insert: (id) => {
      console.log(`inserted: ${id}`);
    },
    update: (id) => {
      console.log(`updated: ${id}`);
    },
    delete: (id) => {
      console.log(`deleted: ${id}`);
    }
  });

module.exports = harvestApp;
