# mongodb-replicaset

## Running

1. Start replicaSet0 members.

`docker-compose up -d mongodb1 mongodb2 mongodb3`

2. Add members to replicaSet0.

`docker-compose up -d mongodbConfigRs0`

3. Start shard 1 configServer.

`docker-compose up -d mongodbConfigRs1`

4. Start shard router.

`docker-compose up -d mongodbRouter`

5. Create first shard in router.

`docker-compose up -d shardConfig`

6. Start express App (give it a few seconds so the replicaSet
  gets configured before starting)
  
  `docker-compose up app`

7. Create kittens!


