FROM mhart/alpine-node:8
RUN apk add --update \
    # Required package to run nodegit
    curl git net-tools g++ diffutils file openssl-dev curl-dev gnutls \
    # Clean up cache / reduce image size
    && rm -rf /var/cache/apk/*

# Create the missing symlink that precompiled nodegit is depending on
RUN ln -s /usr/lib/libcurl.so.4 /usr/lib/libcurl-gnutls.so.4

# Make yarn available
RUN npm install -g yarn && yarn --version 
