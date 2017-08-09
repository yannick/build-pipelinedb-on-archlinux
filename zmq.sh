#!/usr/bin/env bash

wget https://github.com/zeromq/libzmq/releases/download/v4.2.0/zeromq-4.2.0.tar.gz && \
tar -xvf zeromq-4.2.0.tar.gz && \
cd zeromq-4.2.0/ && \
./autogen.sh && \
./configure --enable-static --prefix=/usr && \
make && \
make install && \
ldconfig