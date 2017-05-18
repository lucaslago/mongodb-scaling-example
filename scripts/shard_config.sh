#/bin/bash
mongo --host mongodbRouter <<EOF
  db.adminCommand( { addshard : "rs0/mongodb1" } );
  db.adminCommand( { addshard : "rs1/mongodb4" } );
  db.adminCommand({enableSharding: "test"})
  db.adminCommand({shardCollection: "test.kittens", key: {kittens_id:1}});
  sh.addTagRange("test.kittens", {"kittens_id": 1}, {"kittens_id": 100}, "chunk_0")
  sh.addTagRange("test.kittens", {"kittens_id": 101}, {"kittens_id": 99999999999}, "chunk_1")
  sh.addShardTag("rs0", "chunk_0")
  sh.addShardTag("rs1", "chunk_1")
EOF
