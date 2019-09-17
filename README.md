[![GitHub](https://img.shields.io/github/license/clefss/docker-ionic.svg)](https://tldrlegal.com/license/mit-license#summary) [![GitHub  release](https://img.shields.io/github/release/clefss/docker-ionic.svg)](https://github.com/clefss/docker-ionic/releases) [![Docker  Cloud Build Status](https://img.shields.io/docker/cloud/build/clefss/ionic.svg)](https://hub.docker.com/r/clefss/ionic/builds) [![Docker image size](https://images.microbadger.com/badges/image/clefss/ionic.svg)](https://microbadger.com/images/clefss/ionic "Size")
# Ionic-Docker
### Supported tags
 - [`1.0`, `1`, `latest`](https://github.com/clefss/docker-ionic/blob/v1.0/Dockerfile)
 - [`0.1` (beta)](https://github.com/clefss/docker-ionic/blob/v0.1/Dockerfile)
​
### Run image
    docker run --rm -it -p 8100:8100 -p 35729:35729 -v /dev/bus/usb:/dev/bus/usb -v $(pwd):/app clefss/ionic bash

### Docker compose
    ionic:
      container_name: Ionic
      image: clefss/ionic
      ports:
        - 8100:8100
        - 35729:35729
      volumes:
        - /dev/bus/usb:/dev/bus/usb
        - $(pwd):/app
​
### Features
 - Android
 - Cordova
 - Gradle
 - Ionic
 - Java
 - Node
 - Yarn
