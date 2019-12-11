#!/bin/bash
set -e

docker stop kibana ; docker rm kibana
docker stop elastic ; docker rm elastic
docker run -d -p 9200:9200 -p 9300:9300 --name elastic -e "discovery.type=single-node" elasticsearch:7.1.0
sleep 30

docker build -f Dockerfile -t kibana .
docker run -d -p 5601:5601  --name kibana -e ELASTICSEARCH_HOSTS=http://10.24.2.38:9200 kibana
