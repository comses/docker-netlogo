FROM eclipse-temurin:17-jdk-jammy
LABEL maintainer="Allen Lee <allen.lee@asu.edu>"

ARG NETLOGO_HOME=/opt/netlogo
ARG NETLOGO_VERSION=6.3.0

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    NETLOGO_TARBALL=NetLogo-$NETLOGO_VERSION-64.tgz \
    JAVA_TOOL_OPTIONS=-Xmx4G


ENV NETLOGO_URL=https://ccl.northwestern.edu/netlogo/$NETLOGO_VERSION/$NETLOGO_TARBALL

WORKDIR /opt
RUN wget -q $NETLOGO_URL && tar xzf $NETLOGO_TARBALL && ln -sf "NetLogo $NETLOGO_VERSION" netlogo \
    && rm -f $NETLOGO_TARBALL
