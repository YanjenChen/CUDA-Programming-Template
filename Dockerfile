FROM nvcr.io/nvidia/pytorch:22.04-py3
LABEL maintainer="yjchen@eda.ee.ntu.edu.tw"

# update torch
RUN pip install --upgrade pip 
RUN pip install torch==1.12.0+cu116 torchvision==0.13.0+cu116 torchaudio==0.12.0 --extra-index-url https://download.pytorch.org/whl/cu116

# install dependencies
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y \
    wget \
    flex \
    libcairo2-dev 

RUN wget -O boost_1_66_0.tar.gz https://boostorg.jfrog.io/artifactory/main/release/1.66.0/source/boost_1_66_0.tar.gz && \
    tar xvf boost_1_66_0.tar.gz && \
    cd boost_1_66_0 && \
    ./bootstrap.sh  &&\
    ./b2 -q install -j 8 --without-python

# install cmake
ADD https://cmake.org/files/v3.21/cmake-3.21.0-linux-x86_64.sh /cmake-3.21.0-linux-x86_64.sh
RUN mkdir /opt/cmake \
    && sh /cmake-3.21.0-linux-x86_64.sh --prefix=/opt/cmake --skip-license \
    && ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake \
    && cmake --version

# install commonly used python dependencies
RUN pip install seaborn \
    matplotlib \
    cairocffi \
    setuptools
