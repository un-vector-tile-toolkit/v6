FROM arm32v6/alpine

apk update
apk upgrade
apk add g++ sqlite-dev zlib-dev vim git tmux nodejs yarn npm asciinema

git clone https://github.com/mapbox/tippecanoe
cd tippecanoe && make && make install && cd ..

