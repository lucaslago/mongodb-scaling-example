FROM node:6.9.1

ENV HOME=/home/app

COPY package.json $HOME/mongodb-replicaset/

WORKDIR $HOME/mongodb-replicaset

RUN npm cache clean && npm install

COPY . $HOME/mongodb-replicaset

CMD ["npm", "start"]
