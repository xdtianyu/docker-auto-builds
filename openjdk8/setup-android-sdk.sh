#!/bin/bash

if [ ! -d "/opt/sdk" ];then
    mkdir /opt/sdk && cd /opt/sdk
    wget https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
    unzip -qq tools_r25.2.3-linux.zip
    mkdir licenses
    echo "e6b7c2ab7fa2298c15165e9583d0acf0b04a2232" > licenses/android-sdk-license
    echo "8933bad161af4178b1185d1a37fbf41ea5269c5584831b9409646a918e30573bab4c9c91346d8abdty@desktop" > licenses/android-sdk-preview-license

    cd -

    export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/sdk/tools:/opt/android-ndk-r13b
    export ANDROID_HOME=/opt/sdk
    export ANDROID_SDK=/opt/sdk
fi
