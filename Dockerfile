FROM node:4.2.4

MAINTAINER Jeremymarshall

LABEL "version"="3.7.4"

RUN npm cache clean -f; npm install -g npm; npm install -g yo

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV NODE_PATH=/usr/local/lib/node_modules/:/usr/local/lib  NODE_ENV=production

COPY *.json /usr/src/app/
RUN npm install 

ONBUILD COPY package.json /usr/src/app/
ONBUILD RUN npm install 
ONBUILD COPY . /usr/src/app

CMD [ "npm", "start" ]

EXPOSE 8080

