FROM clefss/base:1.0

LABEL maintainer "Clefss <clefss@protonmail.com>"

ENV ANDROID_SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" \
    # https://github.com/gradle/gradle/releases
    GRADLE_VERSION=5.6.2 \
    # https://nodejs.org
    NODE_VERSION=10.16.3 \
    # https://www.npmjs.com/package/cordova
    CORDOVA_VERSION=9.0.0 \
    # https://www.npmjs.com/package/ionic
    IONIC_VERSION=5.2.8 \
    # https://www.npmjs.com/package/yarn
    YARN_VERSION=1.17.3

# dependencies
WORKDIR /tmp

RUN set -x && \
    buildDeps="unzip wget" && \
    dpkg --add-architecture i386 && \
    apt-get update -qq && \
    apt-get upgrade -qq -y && \
    apt-get install -qq -y ${buildDeps} ca-certificates libncurses5:i386 libstdc++6:i386 zlib1g:i386 --no-install-recommends

# java
ENV JAVA_HOME /opt/java
ENV PATH ${PATH}:${JAVA_HOME}/bin

COPY java-update-alternatives.sh /tmp/java-update-alternatives.sh

RUN mkdir -p /opt/java && \
    wget -O java.tar.gz -c https://www.dropbox.com/s/k3grov7q9z3bxyy/jdk-8u221-linux-x64.tar.gz?dl=1 && \
    tar -xf java.tar.gz -C /opt/java --strip-components=1 && \
    chmod +x java-update-alternatives.sh && \
    ./java-update-alternatives.sh

# gradle
ENV PATH ${PATH}:/opt/gradle-${GRADLE_VERSION}/bin

RUN wget -O gradle-bin.zip https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip -d /opt gradle-bin.zip

# android
ENV ANDROID_HOME /opt/android
ENV PATH ${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/build-tools

COPY android-packages.sh /tmp/android-packages.sh

RUN mkdir -p ${ANDROID_HOME} && \
    wget -O tools.zip ${ANDROID_SDK_URL} && \
    unzip -d ${ANDROID_HOME} tools.zip && \
    mkdir -p /root/.android && \
    echo "### User Sources for Android SDK Manager" >>/root/.android/repositories.cfg && \
    chmod +x android-packages.sh && \
    ./android-packages.sh && \
    chmod a+x -R ${ANDROID_HOME} && \
    chown -R root:root ${ANDROID_HOME}

# node
ENV PATH ${PATH}:/opt/node/bin

RUN mkdir -p /opt/node && \
    wget -O node-linux-x64.tar.gz https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz && \
    tar -xf node-linux-x64.tar.gz -C /opt/node --strip-components=1

# cordova
RUN npm i -g cordova@${CORDOVA_VERSION} && \
    cordova telemetry off

# ionic
RUN npm i -g ionic@${IONIC_VERSION} && \
    ionic config set -g daemon.updates false

# yarn
RUN npm i -g yarn@${YARN_VERSION}

# clean up
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get purge -y --auto-remove ${buildDeps} && \
    apt-get autoremove -y && \
    apt-get clean

# app
WORKDIR /app
EXPOSE 8100 35729
