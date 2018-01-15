FROM ubuntu:16.04

RUN echo 'apt-get update && apt-get install --no-install-recommends -y $*' > /usr/local/bin/pkg-deb
RUN echo 'gem install --no-ri --no-rdoc $*' > /usr/local/bin/pkg-gem
RUN chmod +x /usr/local/bin/pkg-*

RUN pkg-deb linkchecker

RUN pkg-deb \
  build-essential=12.1ubuntu2 \
  ruby2.3 \
  ruby2.3-dev

RUN pkg-deb \
  patch \
  ruby-dev \
  zlib1g-dev \
  liblzma-dev

RUN pkg-gem bundler:1.14.6
RUN bundle config --global silence_root_warning 1
RUN pkg-gem eventmachine:1.2.5
RUN pkg-gem ffi:1.9.18
RUN pkg-gem hpricot:0.8.6
RUN pkg-gem nokogiri:1.8.1
RUN pkg-gem commonmarker:0.17.7.1

WORKDIR /src
COPY Gemfile /src/Gemfile
COPY Gemfile.lock /src/Gemfile.lock
RUN bundle update

# Force choosing a command in docker-compose.yml or CLI
CMD false
