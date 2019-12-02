# Node JS LTS
FROM node:lts

# Install latest npm version 
RUN npm i -g npm@latest

# Create app directory
WORKDIR /usr/src/app

# Copy whole project
COPY ./backend ./

# Install dependencies
ENV NPM_CONFIG_LOGLEVEL warn
RUN npm ci
RUN npm run build

EXPOSE 3000
CMD [ "npm", "run", "start:prod" ]
