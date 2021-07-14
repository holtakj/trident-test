FROM debian:buster-slim

RUN apt-get update && \
    apt-get -y install git libnfs-utils libnfs-dev python3 python3-dev python3-setuptools swig build-essential && \
    mkdir -p /trident && \
    cd /trident && \
    git clone https://github.com/sahlberg/libnfs-python.git && \
    cd /trident/libnfs-python && \
    python3 setup.py install && \
    rm -rf /trident/libnfs-python && \
    apt-get -y purge git python3-setuptools swig build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib{apt,dpkg,cache,log}/

ADD trident-test.py /trident/trident-test.py
RUN python3 -m py_compile /trident/trident-test.py

CMD ["python3", "/trident/trident-test.py"]

