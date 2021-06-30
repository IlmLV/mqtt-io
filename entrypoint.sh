#!/bin/bash

if [ ${APT_INSTALL:+x} ]; then
    echo "$ apt-get install $APT_INSTALL"
    apt-get update
    apt-get install -y $APT_INSTALL
fi
if  [ ${PIP_INSTALL:+x} ]; then
    echo "$ pip install $PIP_INSTALL"
    pip install $PIP_INSTALL
fi
if [ ${APT_UPDATE:+x} ]; then
    echo "$ apt-get upgrade"
    apt-get update
    apt-get upgrade -y
fi
if [ ${PIP_UPDATE:+x} ]; then
    echo "-- UPDATE ALL PIP PACKAGES --"
    pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
fi

echo "-- STARTING mqtt-io --"
exec python -m mqtt_io /config.yml "$@"
