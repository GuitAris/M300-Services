#!/bin/bash
docker rm -f ghost

docker run --name ghost \
 -p 127.0.0.1:2368:2368 \
 -e url=https://blog.guitaris.io \
 -v /root/ghost/content:/var/lib/ghost/content \
 --restart=always \
  -d ghost:1.21.1-alpine
