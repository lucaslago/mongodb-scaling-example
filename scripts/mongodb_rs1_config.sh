mongo --host mongodb4 <<EOF
   var cfg = {
        "_id": "rs1",
        "version": 1,
        "members": [
            {
                "_id": 0,
                "host": "mongodb4",
                "priority": 2
            },
            {
                "_id": 1,
                "host": "mongodb5",
                "priority": 0
            },
            {
                "_id": 2,
                "host": "mongodb6",
                "priority": 0
            },
        ]
    };
    rs.initiate(cfg, {force: true});
    rs.reconfig(cfg, {force: true});
EOF
