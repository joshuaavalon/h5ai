FROM node:alpine as node
WORKDIR /h5ai

COPY . ./

RUN npm install
RUN npm run build

FROM php:7-apache

EXPOSE 80

RUN apt-get update && apt-get install -y \
  ffmpeg \
  graphicsmagick

COPY --from=node /h5ai/build/_h5ai /var/www/html/_h5ai
COPY root/ /
RUN chmod +x /start.sh
RUN rm /var/www/html/_h5ai/*.md

CMD ["/start.sh"]
