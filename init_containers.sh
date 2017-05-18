#/bin/bash
echo 'Starting MongoDB instances'
docker-compose up -d mongodb1 mongodb2 mongodb3 mongodb4 mongodb5 mongodb6

sleep 60

echo 'Configuring rs0'
docker-compose up mongodbConfigRs0

sleep 10

echo 'Configuring rs1'
docker-compose up mongodbConfigRs1

sleep 10

echo 'Starting MongoDB config server'
docker-compose up -d mongodbConfigServer

sleep 60

echo 'Starting MongoDB shard router'
docker-compose up -d mongodbRouter

sleep 60

echo 'Configuring shards'
docker-compose up -d shardConfig
