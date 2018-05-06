#!/bin/bash

VERSION=r16b

if [ ! -d "/opt/ndk" ] || [ -z "$(ls -A /opt/ndk)" ];then
    cd /opt
    wget "https://dl.google.com/android/repository/android-ndk-$VERSION-linux-x86_64.zip"
    unzip -qq "android-ndk-$VERSION-linux-x86_64.zip"
    rm "android-ndk-$VERSION-linux-x86_64.zip"
    mv "android-ndk-$VERSION" ndk
    export ANDROID_NDK=/opt/ndk
    export ANDROID_NDK_HOME=/opt/ndk
    cd -
fi

