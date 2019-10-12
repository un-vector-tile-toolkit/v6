FROM arm32v6/alpine

WORKDIR /root
RUN apk update &&\
  apk upgrade &&\
  apk --no-cache add \
    asciinema \
    autoconf \
    automake \
    bash \
    curl \
    g++ \
    git \
    htop \
    libtool \
    linux-headers \
    make \
    nano \
    nodejs \
    npm \
    python \
    ruby \
    ruby-rake \
    sqlite \
    sqlite-dev \
    tmux \
    vim \
    yarn \
    zip \
    zlib-dev
RUN git clone https://github.com/mapbox/tippecanoe &&\
  cd tippecanoe &&\
  make &&\
  make install &&\
  cd .. &&\
  rm -rf tippecanoe
RUN yarn global add \
  browserify \
  budo \
  hjson \
  pm2 \
  rollup \
  @mapbox/mapbox-gl-style-spec \
  @pushcorn/hocon-parser
RUN git clone https://github.com/maputnik/editor &&\
  cd editor &&\
  npm install &&\
  cd ..
RUN git clone https://github.com/ibesora/vt-optimizer &&\
  cd vt-optimizer &&\
  npm install &&\
  cd ..
RUN git clone https://github.com/OSGeo/PROJ &&\
  cd PROJ &&\
  ./autogen.sh &&\
  ./configure &&\
  make &&\
  make install &&\
  cd .. &&\
  rm -rf PROJ
RUN git clone https://github.com/OSGeo/gdal &&\
  cd gdal/gdal &&\
  ./configure &&\
  make &&\
  make install &&\
  cd ../.. &&\
  rm -rf gdal

