FROM node:6.9.1

ENV HOME=/home/app

COPY package.json $HOME/mongodb-investigation/

WORKDIR $HOME/mongodb-investigation

RUN npm cache clean && npm install

COPY . $HOME/mongodb-investigation

CMD ["npm", "start"]
