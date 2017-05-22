const harvestApp = require('./src/app');
const PORT = 8080;
const onListen = () => console.log(`listening on port ${PORT}`);

harvestApp.listen(PORT, onListen);
