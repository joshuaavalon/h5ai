FROM node:alpine as node
WORKDIR /h5ai

COPY . ./

RUN npm install
RUN npm run build

FROM lsiobase/alpine.nginx:3.8

EXPOSE 80

RUN apk add --no-cache \
  ffmpeg \
  graphicsmagick

RUN mkdir -p /config/{log/nginx,log/php} \
  /data/_h5ai

WORKDIR /data

COPY --from=node /h5ai/build/_h5ai /data/_h5ai
COPY ./docker/default /defaults