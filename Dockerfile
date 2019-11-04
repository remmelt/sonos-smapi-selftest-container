# Note that the newer Ubuntus have > openssl1.0.0, which does not work with the self test code. This
# is why this FROMs 16.04 instead of "python:2" directly
FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    python python-dev ca-certificates libssl-dev \
    libxml2-dev libxslt1-dev gzip curl gcc zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl -s https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py && rm get-pip.py

RUN mkdir /test
WORKDIR /test

RUN curl -s https://musicpartners.sonos.com/sites/default/files/PythonSelfTest.tar.gz | tar xz
RUN pip install -r smapi/content_workflow/requirements.txt
RUN pip install psutil

VOLUME /test/smapi/service_configs

WORKDIR /test/smapi/content_workflow

CMD python suite_selftest.py
