FROM nginx:alpine

LABEL maintainer="relief melone, relief.melone@gmail.com"

# Install NodeJS
RUN apk update && \
    apk add nodejs npm python make curl g++

# Install Lua Module
RUN apk add --no-cache nginx-mod-http-lua

# Copy Config Files
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Change Permissions to make image usable on Openshift
RUN chgrp -R root /var/cache/nginx /var/run /var/log/nginx && \
    chmod -R 770 /var/cache/nginx /var/run /var/log/nginx

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
