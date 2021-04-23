# mqtt-io

## tl;dr
[mqtt-io](https://github.com/flyte/mqtt-io) docker prebuild images

## Serving suggestions

### docker-compose example for Raspberry PI
```
version: '3'
services:

  mqtt-io:
    container_name: mqtt-io
    image: ilmlv/mqtt-io:latest
    privileged: true
    group_add: 
      - 998
      - 997
    devices:
      - /dev/mem:/dev/mem
      - /dev/gpiomem:/dev/gpiomem
      - /dev/i2c-1:/dev/i2c-1
    volumes:
      - ./mqtt-io.yml:/config.yml
      - /etc/localtime:/etc/localtime:ro
      - /etc/timezone:/etc/timezone:ro
    #environment:
    #  APT_INSTALL: <all linux packages> # default: none
    #  PIP_INSTALL: <all necessary python packages> # default: none
    #  APT_UPDATE: true # default: false
    #  PIP_UPDATE: true # default: false
    restart: unless-stopped
```

### standalone docker container

```
docker run -ti --rm -v ./config.yml:/mqtt-io.yml ilmlv/mqtt-io:latest
```

## Configuration
More info about mqtt-io configuration check on [mqtt-io](https://github.com/flyte/mqtt-io)

