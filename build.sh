#!/bin/bash

cp /usr/bin/etcdctl .
cp /usr/bin/docker .
cp /lib64/libdevmapper.so.1.02 .

docker build -t localhost:5000/docker-etcd-config .
