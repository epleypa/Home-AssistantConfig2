### Docker letsencrypt

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

### Docker smartthings-mqtt-bridge (no longer in use)

```
docker build -t smartthings-mqtt-bridge -f Dockerfile-rpi https://github.com/stjohnjohnson/smartthings-mqtt-bridge.git

docker run \
    -d \
    --name="mqtt-bridge" \
    -v /opt/mqtt-bridge:/config \
    -p 8081:8080 \
    smartthings-mqtt-bridge
```