FROM openjdk:8-jdk
LABEL maintainer="Allen Lee <allen.lee@asu.edu>"

ONBUILD ARG NETLOGO_HOME=/opt/netlogo
ONBUILD ARG NETLOGO_VERSION=6.0.4

ONBUILD ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    NETLOGO_TARBALL=NetLogo-$NETLOGO_VERSION-64.tgz

ONBUILD ENV NETLOGO_URL=https://ccl.northwestern.edu/netlogo/$NETLOGO_VERSION/$NETLOGO_TARBALL

WORKDIR /opt
ONBUILD RUN wget $NETLOGO_URL && tar xzf $NETLOGO_TARBALL && ln -sf "NetLogo $NETLOGO_VERSION" netlogo \
            && rm -f $NETLOGO_TARBALL
