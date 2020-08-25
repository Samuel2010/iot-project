#!/bin/bash
cur_dir=`pwd`

docker stop tdengine
docker rm tdengine
#docker run --restart=always --name tdengine -d -v /etc/taos:/etc/taos -p 6030:6030 -p 6035:6035 -p 6041:6041 -p 6030-6040:6030-6040/udp tdengine/tdengine:2.0.0.0
docker run --restart=always \
    -d -v  `pwd`/logs/:/etc/taos -p 6030:6030 \
    -v /data/docker-data/TDengine-data/:/var/log/taos \
    -v`pwd`/taos.cfg:/etc/taos/taos.cfg \
    -p 6035:6035 -p 6041:6041 -p 6030-6040:6030-6040/udp tdengine/tdengine:2.0.0.0