Home Assistant Configuration [![Alt Text](https://travis-ci.org/epleypa/Home-AssistantConfig.svg?branch=master)](https://travis-ci.org/epleypa/Home-AssistantConfig)
=================================================================================

Home Assistant is a home automation platform running on Python 3. It is able to track and control all devices at home and offer a platform for automating control.

Check out [home-assistant.io](https://home-assistant.io)

[![Alt Text](https://raw.github.com/home-assistant/home-assistant/master/docs/screenshots.png)](https://home-assistant.io/demo/)

## Docker [linuxserver/letsencrypt](https://hub.docker.com/r/linuxserver/letsencrypt/)

```
docker create \
  --cap-add=NET_ADMIN \
  --name=letsencrypt \
  -v /srv/letsencrypt:/config \
  -e PGID=1000 -e PUID=1000  \
  -e EMAIL=ABCD@ABCD.com \
  -e URL=ABCD.com \
  -e VALIDATION=http \
  -p 80:80 -p 443:443 \
  -e TZ=America/New_York \
  linuxserver/letsencrypt
```

Below are the instructions for updating containers:  
  
### Via Docker Run/Create
* Update the image: `docker pull linuxserver/letsencrypt`
* Stop the running container: `docker stop letsencrypt`
* Delete the container: `docker rm letsencrypt`
* Recreate a new container with the same docker create parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* Start the new container: `docker start letsencrypt`
* You can also remove the old dangling images: `docker image prune`

### Via Taisun auto-updater (especially useful if you don't remember the original parameters)
* Pull the latest image at its tag and replace it with the same env variables in one shot:
  ```
  docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock taisun/updater \
  --oneshot letsencrypt
  ```
* You can also remove the old dangling images: `docker image prune`


## Amazon Dash (https://github.com/Nekmo/amazon-dash)
```
docker build -t amazon-dash -f Dockerfile https://github.com/Nekmo/amazon-dash.git

docker run -it --network=host \
             -v /srv/amazon-dash:/config \
             shoejosh/amazon-dash-rpi \
             amazon-dash run --ignore-perms --root-allowed \
                             --config /config/amazon-dash.yml
```

## Sunset Configurations

### Docker [stjohnjohnson/smartthings-mqtt-bridge](https://github.com/stjohnjohnson/smartthings-mqtt-bridge) (no longer in use)

```
docker build -t smartthings-mqtt-bridge -f Dockerfile-rpi https://github.com/stjohnjohnson/smartthings-mqtt-bridge.git

docker run \
    -d \
    --name="mqtt-bridge" \
    -v /opt/mqtt-bridge:/config \
    -p 8081:8080 \
    smartthings-mqtt-bridge
```
