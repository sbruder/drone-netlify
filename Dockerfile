FROM node:alpine

RUN npm install -g netlify-cli

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
