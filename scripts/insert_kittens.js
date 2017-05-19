var i;
for(i = 0; i <= 10000; i++) {
  db.kittens.insert({kitten_id: i, name:'kitten' + i});
}
