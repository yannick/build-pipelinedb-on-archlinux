#!/usr/bin/env bash
cd /tmp/install
git clone https://github.com/pipelinedb/pipelinedb.git
cd pipelinedb
./configure CFLAGS="-g -O0" --enable-cassert --prefix=/opt --without-openssl
make
