#sample dockerfile that makes a docker iamge.

#base image : node
FROM node:alpine
COPY . /app
WORKDIR /app
CMD node app.js
