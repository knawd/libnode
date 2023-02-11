FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ENV WASMTIME_VERSION=v5.0.0
RUN apt update --fix-missing
RUN apt-get install -y curl make git gcc build-essential pkgconf libtool libsystemd-dev libprotobuf-c-dev libcap-dev libseccomp-dev libyajl-dev go-md2man libtool autoconf python3 automake xz-utils

WORKDIR /wasm_nodejs
RUN git clone --depth 1 -b napi-libnode https://github.com/mmomtchev/node.git
WORKDIR /wasm_nodejs/node
RUN ./configure --shared
RUN make