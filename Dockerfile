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
  git clone https://github.com/maputnik/editor &&\
  git clone https://github.com/ibesora/vt-optimizer &&\
  git clone https://github.com/OSGeo/PROJ &&\
  git clone https://github.com/OSGeo/gdal
RUN cd tippecanoe &&\
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
RUN cd editor &&\
  npm install &&\
  cd ..
RUN cd vt-optimizer &&\
  npm install &&\
  cd ..
RUN cd PROJ &&\
  ./autogen.sh &&\
  ./configure &&\
  make &&\
  make install &&\
  cd .. &&\
  rm -rf PROJ
RUN cd gdal/gdal &&\
  ./configure &&\
  make &&\
  make install &&\
  cd ../.. &&\
  rm -rf gdal

