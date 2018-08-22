FROM node:alpine as node
WORKDIR /h5ai

COPY . ./

RUN npm install
RUN npm run build

FROM nginx:alpine

EXPOSE 80

RUN apk add --no-cache \
  shadow \
  ffmpeg \
  graphicsmagick \
  php7 \
  php7-fpm \
  php7-gd \
  php7-json \
  php7-mbstring \
  php7-openssl \
  php7-session \
  php7-xml \
  php7-exif \
  php7-zlib && \  
  rm /etc/nginx/conf.d/* && \
  rm /etc/php7/php-fpm.d/*

WORKDIR /data

COPY docker/nginx.conf.d /etc/nginx/conf.d/
COPY docker/php-fpm.d /etc/php7/php-fpm.d/
COPY --from=node /h5ai/_h5ai /data

RUN /usr/sbin/php-fpm7
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]