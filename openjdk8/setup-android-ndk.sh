#!/bin/bash

if [ ! -d "/opt/android-ndk-r13b" ];then
    cd /opt
    wget https://dl.google.com/android/repository/android-ndk-r13b-linux-x86_64.zip
    unzip -qq android-ndk-r13b-linux-x86_64.zip
    export ANDROID_NDK=/opt/android-ndk-r13b
    export ANDROID_NDK_HOME=/opt/android-ndk-r13b
    cd -
fi

