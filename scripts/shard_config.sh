#/bin/bash
mongo --host mongodbRouter <<EOF
  db.adminCommand( { addshard : "rs0/mongodb1" } );
  db.adminCommand({enableSharding: "test"})
  db.adminCommand({shardCollection: "test.kittens", key: {kittens_id:1}});
EOF
