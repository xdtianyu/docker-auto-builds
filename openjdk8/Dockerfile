FROM openjdk:8-jdk

MAINTAINER ty "xdtianyu@gmail.com"

# Add Jenkins user
RUN addgroup -q --gid 119 runner
RUN adduser --quiet --uid 113 --gid 119 --disabled-password --gecos "Runner" runner
RUN usermod -a -G sudo runner
RUN mkdir -p /builds
RUN wget https://gist.githubusercontent.com/xdtianyu/39588ca066360ad7d3e471c126c13538/raw/setup-android-sdk.sh -O /opt/setup-android-sdk.sh
RUN wget https://gist.githubusercontent.com/xdtianyu/39588ca066360ad7d3e471c126c13538/raw/setup-android-ndk.sh -O /opt/setup-android-ndk.sh
RUN chown runner /builds && chmod +x /opt/* && chown runner /opt
RUN mkdir -p /home/runner/.android && chown runner /home/runner/.android

# Set user
USER runner
