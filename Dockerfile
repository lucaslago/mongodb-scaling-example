FROM node:6.9.1

ENV HOME=/home/app

COPY package.json $HOME/mongodb-scaling-example/

WORKDIR $HOME/mongodb-scaling-example/

RUN npm install

COPY . $HOME/mongodb-scaling-example/

CMD ["npm", "start"]
