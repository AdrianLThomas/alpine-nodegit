FROM amazonlinux:2018.03
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash
RUN yum -y install \
    # Required package to run nodegit
    nodejs net-tools gcc-c++ diffutils file openssl-devel libcurl-devel libcurl3-gnutls \
    # Dependencies to rebuild nodegit
    python make \
    # Clean up cache / reduce image size
    && yum clean all

# Rebuild nodegit for this image
RUN BUILD_ONLY=true npm install nodegit --save && rm package-lock.json

# Make yarn available
RUN npm install -g yarn && yarn --version 

# Fix for libcurl
RUN ln -s /usr/lib64/libcurl.so.4 /usr/lib64/libcurl-gnutls.so.4
