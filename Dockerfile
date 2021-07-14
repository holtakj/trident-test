FROM debian:buster-slim

RUN apt-get update && \
    apt-get -y install git libnfs-utils libnfs-dev python3 python3-dev python3-setuptools swig build-essential

RUN mkdir -p /trident && \
    cd /trident && \
    git clone https://github.com/sahlberg/libnfs-python.git

RUN cd /trident/libnfs-python && \
    python3 setup.py install

ADD trident-test.py /trident/trident-test.py
RUN python3 -m py_compile /trident/trident-test.py

CMD ["python3", "/trident/trident-test.py"]

