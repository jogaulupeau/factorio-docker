#### Build Docker Image

```bash
git clone ...
cd factorio
docker build -t factorio .
```


#### Start a new game

```bash
docker run --rm -v "/opt/factorio_saves:/factorio/saves" factorio --create mygame
```


#### Run Factororio server

```bash
docker run -d --name factorio \
  -p "34197:34197/udp" \
  -v "/opt/factorio_saves:/factorio/saves" \
  factorio \
  --start-server mygame
```


#### Load a previous save to server

```bash
# ensure server is stopped
docker kill factorio

# copy save into volume
docker cp mygame.zip factorio:/factorio/saves/

# start server again
docker start factorio
```


#### Back up a save games (this backs up all saves including autosaves)

```bash
docker cp factorio:/factorio/saves .
``` 
