FROM arm32v6/alpine

RUN apk update
RUN apk upgrade
RUN apk add \
  asciinema \
  curl \
  g++ \
  git \
  htop \
  nano \
  nodejs \
  npm \
  ruby \
  sqlite-dev \
  tmux \
  vim \
  yarn \
  zip \
  zlib-dev \

RUN git clone https://github.com/mapbox/tippecanoe
RUN cd tippecanoe && make && make install && cd ..

