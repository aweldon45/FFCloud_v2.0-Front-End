FROM node:8-alpine

WORKDIR /home/node/ffc/client

ADD . .

RUN npm install && npm run build

EXPOSE 80

CMD npm start
