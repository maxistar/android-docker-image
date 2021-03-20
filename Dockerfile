FROM debian:9

MAINTAINER Max Starikov <maxim.starikov@gmail.com>

ENV ANDROID_SDK_ROOT=/opt/android
ENV GRADLE_HOME=/opt/gradle/gradle-6.8.3
ENV PATH=${GRADLE_HOME}/bin:${ANDROID_SDK_ROOT}/tools/bin:${PATH}

RUN apt-get update && apt-get -y install git wget unzip default-jdk

RUN wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip -P /tmp && \
    unzip -d /opt/android /tmp/sdk-tools-linux-3859397.zip && \
    wget https://services.gradle.org/distributions/gradle-6.8.3-bin.zip -P /tmp && \
    unzip -d /opt/gradle /tmp/gradle-6.8.3-bin.zip && \
    sdkmanager --update && \
    yes | sdkmanager --licenses  && \
    sdkmanager "build-tools;30.0.2" "platform-tools" "platforms;android-30" && \
    yes | sdkmanager --licenses && \
    mkdir /var/app

WORKDIR /var/app