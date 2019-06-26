FROM mhart/alpine-node:8
RUN apk add --update \
    # Required package to run nodegit
    curl git net-tools g++ diffutils file openssl-dev curl-dev gnutls \
    # Dependencies to rebuild nodegit
    python make \
    # Clean up cache / reduce image size
    && rm -rf /var/cache/apk/*

# Rebuild nodegit for this image
RUN cd /tmp && BUILD_ONLY=true npm install nodegit && cd -

# Make yarn available
RUN npm install -g yarn && yarn --version 
