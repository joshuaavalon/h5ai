FROM node:alpine as node
WORKDIR /h5ai

COPY . ./

RUN npm install
RUN npm run build

FROM php:7-apache

EXPOSE 80

RUN apt-get install -y \
  ffmpeg \
  graphicsmagick

COPY --from=node /h5ai/build/_h5ai /var/www/html/_h5ai
COPY root/ /
RUN rm /var/www/html/_h5ai/*.md