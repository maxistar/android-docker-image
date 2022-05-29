FROM debian:10

MAINTAINER Max Starikov <maxim.starikov@gmail.com>

ENV ANDROID_SDK_ROOT=/opt/android
ENV GRADLE_HOME=/opt/gradle/gradle-7.3.1
ENV PATH=${GRADLE_HOME}/bin:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${PATH}

RUN apt-get update && apt-get -y install git wget unzip default-jdk

RUN wget https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip -P /tmp && \
    mkdir -p /opt/android/cmdline-tools && \
    unzip -d /opt/android/cmdline-tools /tmp/commandlinetools-linux-8512546_latest.zip && \
    mv /opt/android/cmdline-tools/cmdline-tools /opt/android/cmdline-tools/latest && \
    wget https://services.gradle.org/distributions/gradle-7.3.1-bin.zip -P /tmp && \
    unzip -d /opt/gradle /tmp/gradle-7.3.1-bin.zip && \
    sdkmanager --update && \
    yes | sdkmanager --licenses  && \
    mkdir /var/app

#    sdkmanager "build-tools;30.0.2" "platform-tools" "platforms;android-30" && \
#    yes | sdkmanager --licenses && \


WORKDIR /var/app