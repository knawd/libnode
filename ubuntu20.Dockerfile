FROM ubuntu:20.04 as ubuntu20builder

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ENV WASMTIME_VERSION=v5.0.0
RUN apt update --fix-missing

WORKDIR /wasm_nodejs
RUN git clone --depth 1 -b napi-libnode https://github.com/mmomtchev/node.git
WORKDIR /wasm_nodejs/node
RUN ./configure --shared
RUN make