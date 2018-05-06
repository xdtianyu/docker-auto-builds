#!/bin/bash

if [ ! -d "/opt/sdk" ] || [ -z "$(ls -A /opt/sdk)" ];then
    mkdir /opt/sdk && cd /opt/sdk
    wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
    unzip -qq sdk-tools-linux-3859397.zip
    rm sdk-tools-linux-3859397.zip
    mkdir licenses
    echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > licenses/android-sdk-license
    echo "d56f5187479451eabf01fb78af6dfcb131a6481e" >> licenses/android-sdk-license
    echo "84831b9409646a918e30573bab4c9c91346d8abd" > licenses/android-sdk-preview-license

    cd -

    export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/sdk/tools:/opt/ndk
    export ANDROID_HOME=/opt/sdk
    export ANDROID_SDK=/opt/sdk
fi
