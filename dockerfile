FROM ubuntu:xenial-20191212
RUN echo "nameserver 8.8.8.8" >> /etc/resolv.conf
MAINTAINER zengzhuo<zhuo.zeng@sim.com>

RUN apt-get update
RUN apt-get install -y openssl
ENV LANG C.UTF-8

RUN mkdir /usr/local/jdk
WORKDIR /usr/local/jdk
#ADD jre1.8.0_231.tar.gz /usr/local/jdk
# 安装openblas
RUN mkdir -p /usr/local/openblas
ADD openblas/lib/libopenblas.so /usr/local/openblas/lib/
ADD /openblas/lib/libopenblas.so.0 /usr/local/openblas/lib/
RUN ln -s /usr/local/openblas/lib/libopenblas.so /usr/lib/
RUN ln -s /usr/local/openblas/lib/libopenblas.so.0 /usr/lib/
# 安装protobuf
RUN mkdir -p /usr/local/protobuf/lib/
ADD protobuf/lib/libprotobuf.so /usr/local/protobuf/lib/
ADD protobuf/lib/libprotobuf-lite.so.9 /usr/local/protobuf/lib/
RUN ln -s /usr/local/protobuf/lib/libprotobuf.so /usr/lib/
RUN ln -s /usr/local/protobuf/lib/libprotobuf.so.9 /usr/lib/

ENV JAVA_HOME /usr/local/jdk/jre1.8.0_231
ENV PATH $JAVA_HOME/bin:$PATH