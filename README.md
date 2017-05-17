# mongodb-replicaset

## Running

1. Start Replica set members

`docker-compose up -d mongodb1 mongodb2 mongodb3`

1. Add members to replicaSet

`docker-compose up -d mongodbConfig`

1. Start express App (give it a few seconds so the replicaSet
  gets configured before starting)

   `docker-compose up app`

1. Create kittens!

