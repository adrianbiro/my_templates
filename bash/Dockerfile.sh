# apt stuff for small image
RUN : \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        <pkg1> \
        <pkg2> \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#  Setting Locale using Dockerfile
ENV LANG=C.UTF-8
ENV LANG en_US.UTF-8