FROM nginx:alpine

LABEL maintainer="relief melone, relief.melone@gmail.com"

RUN apk update && \
    apk add nodejs npm python make curl g++

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/conf.d /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]