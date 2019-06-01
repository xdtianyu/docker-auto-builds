FROM openjdk:8-jdk

MAINTAINER ty "xdtianyu@gmail.com"

# Add Jenkins user
RUN addgroup -q --gid 119 runner
RUN adduser --quiet --uid 113 --gid 119 --disabled-password --gecos "Runner" runner
RUN usermod -a -G sudo runner
RUN mkdir -p /builds
ADD setup-android-sdk.sh /opt/setup-android-sdk.sh
ADD setup-android-ndk.sh /opt/setup-android-ndk.sh
RUN chown runner /builds && chmod +x /opt/* && chown runner /opt
RUN mkdir -p /home/runner/.android && chown runner /home/runner/.android

# Set user
USER runner
