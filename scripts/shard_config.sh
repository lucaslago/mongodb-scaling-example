#/bin/bash
mongo --host mongodbRouter <<EOF
  db.adminCommand( { addshard : "rs0/mongodb1" } );
  db.adminCommand( { addshard : "rs1/mongodb4" } );
  db.adminCommand({enableSharding: "test"})
  db.adminCommand(
  {
    shardCollection: "test.kittens",
    key: {"_id": "hashed"},
    unique: false,
    numInitialChunks: 2
  });
EOF
