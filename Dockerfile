FROM mhart/alpine-node:8
RUN apk add --update \
    curl net-tools g++ diffutils file openssl-dev curl-dev gnutls \ 
    && rm -rf /var/cache/apk/*
RUN npm install -g yarn && yarn --version 
