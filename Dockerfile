FROM arm32v6/alpine

RUN apk update
RUN apk upgrade
RUN apk add \
  asciinema \
  bash \
  curl \
  g++ \
  git \
  htop \
  make \
  nano \
  nodejs \
  npm \
  ruby \
  sqlite-dev \
  tmux \
  vim \
  yarn \
  zip \
  zlib-dev

RUN git clone https://github.com/mapbox/tippecanoe &&\
  cd tippecanoe && make && make install && cd ..

RUN yarn global add \
  browserify \
  budo \
  hjson \
  pm2 \
  rollup \
  @mapbox/mapbox-gl-style-spec \
  @pushcorn/hocon-parser

RUN git clone https://github.com/maputnik/editor &&\
  yarn

RUN git clone https://github.com/ibesora/vt-optimizer &&\
  yarn

