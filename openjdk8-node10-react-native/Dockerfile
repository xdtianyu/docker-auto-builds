FROM xdtianyu/docker:openjdk8

MAINTAINER ty "xdtianyu@gmail.com"

USER root

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get install -y nodejs yarn \
  && apt-get clean \
  && npm install -g react-native-cli

# Set user
USER runner
