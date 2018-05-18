FROM node:alpine

RUN npm install -g netlify-cli

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
