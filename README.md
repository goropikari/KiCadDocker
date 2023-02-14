```bash
KICAD_VERSION=7.0
docker build -t kicad . --build-arg KICAD_VERSION=${KICAD_VERSION}
docker tag kicad goropikari/kicad:${KICAD_VERSION}
docker push goropikari/kicad:${KICAD_VERSION}

docker run -it --rm -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/home/ubuntu/.Xauthority --network host kicad


export KICAD_VERSION=7.0 KICAD_PROJECT=/path/to/your/kicad_project
docker compose run kicad
```
