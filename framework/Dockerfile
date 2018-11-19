# Pull base image
FROM ruby:2.4.1-slim

# dependencies
# set-up the basic machine
RUN \
  apt-get update \
  && apt-get -y install \
  wget \
  npm

#Copy the repo into the container
COPY ../../rtv_test/framework /rtv_test/framework/

RUN \
  # Create Reports Directory
  mkdir -p rtv_test/framework/reports && \
  # Install Chromedriver 2.34
  wget -qO- https://chromedriver.storage.googleapis.com/2.35/chromedriver_linux64.zip | gunzip -d > /usr/local/bin/chromedriver \
  && chmod 755 /usr/local/bin/chromedriver \
  # Set the timezone to US/Central
  && ln -snf /usr/share/zoneinfo/US/Central /etc/localtime && echo US/Central > /etc/timezone \
  # Install the latest Chrome Stable & Nodejs
  && wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && apt-get update \
  && apt-get -y install libgconf2-4 libnss3-1d libxss1 \
  && apt-get -y install google-chrome-stable \
  # Install the remaining GEM needed to
  && cd test-rtv_test/framework && bundle install

WORKDIR /rtv_test/framework
