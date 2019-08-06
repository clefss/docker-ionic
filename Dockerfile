FROM ubuntu:18.04

LABEL maintainer "Clefss <clefss@protonmail.com>"

ENV DEBIAN_FRONTEND=noninteractiv \
    TERM=xterm \
    # https://cordova.apache.org/docs/en/8.x/guide/platforms/android/#installing-the-requirements
    JAVA_VERSION=8 \
    # https://github.com/gradle/gradle/releases
    GRADLE_VERSION=5.2.1 \
    # https://developer.android.com/studio/releases/sdk-tools V26.1.1
    ANDROID_SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" \
    # https://developer.android.com/studio/releases/build-tools
    ANDROID_BUILD_TOOLS_VERSION=28.0.3 \
    # https://source.android.com/setup/start/build-numbers
    ANDROID_APIS="android-28" \
    ANDROID_HOME="/opt/android" \
    # https://nodejs.org/en/
    NODE_VERSION=11.10.0 \
    # https://www.npmjs.com/package/cordova
    CORDOVA_VERSION=8.1.2 \
    # https://www.npmjs.com/package/ionic
    IONIC_VERSION=4.10.3

# dependencies
WORKDIR /tmp

RUN mkdir /app && \
    buildDeps='software-properties-common'; \
    set -x && \
    dpkg --add-architecture i386 && \
    apt-get -qq update && \
    apt-get -qq install -y $buildDeps curl git ca-certificates bzip2 openssh-client unzip wget libncurses5:i386 libstdc++6:i386 zlib1g:i386 --no-install-recommends

# java # use WebUpd8 PPA
RUN add-apt-repository ppa:webupd8team/java -y && \
    apt-get -qq update -y && \
    # automatically accept the Oracle license
    echo oracle-java"$JAVA_VERSION"-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get -qq install -y oracle-java"$JAVA_VERSION"-installer oracle-java"$JAVA_VERSION"-set-default

ENV JAVA_HOME=/usr/lib/jvm/java-"$JAVA_VERSION"-oracle

# gradle
RUN wget https://services.gradle.org/distributions/gradle-"$GRADLE_VERSION"-bin.zip && \
    mkdir /opt/gradle && \
    unzip -d /opt/gradle gradle-"$GRADLE_VERSION"-bin.zip

ENV PATH=$PATH:/opt/gradle/gradle-"$GRADLE_VERSION"/bin

# android
WORKDIR /opt/android

ENV PATH $PATH:"$ANDROID_HOME"/platform-tools:"$ANDROID_HOME"/tools:"$ANDROID_HOME"/build-tools/"$ANDROID_BUILD_TOOLS_VERSION"

RUN wget -O tools.zip "$ANDROID_SDK_URL" && \
    unzip tools.zip && \
    rm tools.zip && \
    # echo y | android update sdk -a -u -t platform-tools,"$ANDROID_APIS",build-tools-"$ANDROID_BUILD_TOOLS_VERSION" && \
    yes Y | "$ANDROID_HOME"/tools/bin/sdkmanager "build-tools;$ANDROID_BUILD_TOOLS_VERSION" "platforms;$ANDROID_APIS" "platform-tools" && \
    chmod a+x -R "$ANDROID_HOME" && \
    chown -R root:root "$ANDROID_HOME"

# node
WORKDIR /opt/node

RUN curl -sL https://nodejs.org/dist/v"$NODE_VERSION"/node-v"$NODE_VERSION"-linux-x64.tar.gz | tar xz --strip-components=1

ENV PATH=$PATH:/opt/node/bin

# ionic & cordova
WORKDIR /tmp

RUN npm i -g ionic@"$IONIC_VERSION" cordova@"$CORDOVA_VERSION" && \
    ionic config set -g daemon.updates false && \
    cordova telemetry off

# clean up
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get purge -y --auto-remove $buildDeps && \
    apt-get autoremove -y && \
    apt-get clean

# app
WORKDIR /app
EXPOSE 8100 35729
