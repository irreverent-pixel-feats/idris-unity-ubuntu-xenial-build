FROM irreverentpixelfeats/idris-cil-build:ubuntu_xenial_1.0-20170901065315-0a15528
MAINTAINER Dom De Re <domdere@irreverentpixelfeats.com>

ENV UNITY_VERSION=5.6.1xf1Linux

# could possibly replace libgl1-mesa-glx with libgl1 and libglu1-mesa with libglu1
RUN apt-get update \
  && apt-get install -y \
        gconf-service \
        lib32gcc1 \
        lib32stdc++6 \
        libasound2 \
        libc6 \
        libc6-i386 \
        libcairo2 \
        libcap2 \
        libcups2 \
        libdbus-1-3 \
        libexpat1 \
        libfontconfig1 \
        libfreetype6 \
        libgcc1 \
        libgconf-2-4 \
        libgdk-pixbuf2.0-0 \
        libgl1-mesa-glx \
        libglib2.0-0 \
        libglu1-mesa \
        libgtk2.0-0 \
        libnspr4 \
        libnss3 \
        libpango1.0-0 \
        libstdc++6 \
        libx11-6 \
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxext6 \
        libxfixes3 \
        libxi6 \
        libxrandr2 \
        libxrender1 \
        libxtst6 \
        zlib1g \
        debconf \
        npm \
        libpq5 \
        xdg-utils \
        libav-tools \
        nodejs \
        gzip \
        openjdk-9-jre
        # java7-jdk # for Android and Tizen


# the magic link points to the desired specific version of unity
#  && curl -OL https://s3.amazonaws.com/irreverent-software-bucket-us/unity/linux/unity-editor_amd64-${UNITY_VERSION}.deb \
RUN mkdir -p /etc/unity \
  && cd /etc/unity \
  && curl -OL https://s3.amazonaws.com/irreverent-software-bucket-us/unity/linux/unity-editor_amd64-${UNITY_VERSION}.deb \
  && dpkg -i unity-editor_amd64-${UNITY_VERSION}.deb \
  && cd / \
  && rm -rfv /etc/unity

# stuff in the data dir is likely to change very frequently but doesnt actually affect the image much itself,
# example: version SHAs
# So adding it last should speed up the builds
ADD data /tmp

# Add the git-sha for the docker file to the image so if you need you can see where
# your image sat in the timeline of git changes (which might be tricky to correlate with the
# docker hub changes)
RUN mkdir -p /var/versions && cp -v /tmp/version /var/versions/idris-unity-build-ubuntu_xenial.version
