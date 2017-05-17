mongo --host mongodb1 <<EOF
   var cfg = {
        "_id": "rs0",
        "version": 1,
        "members": [
            {
                "_id": 0,
                "host": "mongodb1",
                "priority": 2
            },
            {
                "_id": 1,
                "host": "mongodb2",
                "priority": 0
            },
            {
                "_id": 2,
                "host": "mongodb3",
                "priority": 0
            },
        ]
    };
    rs.initiate(cfg, {force: true});
    rs.reconfig(cfg, {force: true});
EOF
