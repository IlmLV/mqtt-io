FROM python:3.9-buster

MAINTAINER IlmLV

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ARG VERSION
ARG APT_INSTALL
ARG PIP_INSTALL

RUN if [ "$APT_INSTALL" != "" ] ; then \
        apt-get update && \
        apt-get install -y $APT_INSTALL && \
        rm -rf /var/lib/apt/lists/* ; \
    fi

RUN if [ "$PIP_INSTALL" != "" ] ; then \
        pip install $PIP_INSTALL ; \
    fi

# Create user
RUN useradd -m -s /bin/bash mqttio
USER mqttio
WORKDIR /home/mqttio

# Install mqtt-io
RUN if [ "$VERSION" != "" ] ; then \
        pip install mqtt-io==$VERSION ; \
    else \
        pip install mqtt-io ; \
    fi

COPY entrypoint.sh /mqtt-io/entrypoint.sh

ENTRYPOINT ["/mqtt-io/entrypoint.sh"]
