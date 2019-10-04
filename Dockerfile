FROM arm32v6/alpine

RUN apk update
RUN apk upgrade
RUN apk add g++ sqlite-dev zlib-dev vim git tmux nodejs yarn npm asciinema

RUN git clone https://github.com/mapbox/tippecanoe
RUN cd tippecanoe && make && make install && cd ..

