FROM ubuntu:bionic
MAINTAINER smean.lee@kt.com

#Dependency Install 
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
       build-essential make gcc git libcpprest-dev ca-certificates \
    && rm -rf /var/lib/apt/lists/*

#hiredis
RUN git clone https://github.com/redis/hiredis.git \
    && cd hiredis \
    && make && make install

ENV OPEN_CV opencv-lib
ENV HIREDIS hiredis

RUN mkdir application
ENV WORK_PATH /application

#your library 
ENV CONTENT_ALL .
ENV LIB_PATH x86_64-linux-gnu
ENV LIB_PATH_ALL /usr/lib/${LIB_PATH}

ADD ${CONTENT_ALL} ${WORK_PATH}
WORKDIR ${WORK_PATH}

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${LIB_PATH_ALL}:${WORK_PATH}/${OPEN_CV}:${WORK_PATH}/${HIREDIS}:${WORK_PATH}/etc

EXPOSE 8888
CMD "./webrtc_server"

#webrtc_server
#libboost_system, libcrypto, cpprest, pthread, dl, X11
