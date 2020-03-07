FROM simpicapp/golang-imagemagick

ARG CHROME_VERSION=80.0.3987.87
ARG FIREFOX_VERSION=72.0.2
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

RUN apt-get update \
    # For semaphore:
    && apt-get --no-install-recommends -y install openssh-client lftp coreutils \
    # For chrome:
    && apt-get --no-install-recommends -y install fonts-liberation libappindicator3-1 xdg-utils \
    # For building the project:
    && apt-get --no-install-recommends -y install git npm \
    # Chrome:
    && wget -O /usr/src/google-chrome-stable_current_amd64.deb "http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}-1_amd64.deb" \
    && dpkg -i /usr/src/google-chrome-stable_current_amd64.deb \
    ;  apt-get install -f -y \
    && rm -f /usr/src/google-chrome-stable_current_amd64.deb \
    # Firefox:
    && wget -O /tmp/firefox.tar.bz2 https://download-installer.cdn.mozilla.net/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2 \
    && tar -C /opt -xjf /tmp/firefox.tar.bz2 \
    && rm /tmp/firefox.tar.bz2 \
    && ln -fs /opt/firefox/firefox /usr/bin/firefox \
    # Clean up:
    && rm -rf /var/lib/apt/lists/* 

