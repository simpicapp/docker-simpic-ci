FROM simpicapp/golang-imagemagick

RUN apt-get update \
    # For semaphore:
    && apt-get --no-install-recommends -y install openssh-client lftp coreutils \
    # For building the project:
    && apt-get --no-install-recommends -y install git npm \
    && rm -rf /var/lib/apt/lists/* 
