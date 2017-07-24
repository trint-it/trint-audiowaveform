FROM ubuntu
MAINTAINER Norman Khine <norman@khine.net>

RUN apt-get update \
    && apt install -y cmake \
                      g++ \
                      gcc \
                      git-core \
                      libboost-all-dev \
                      libgd2-xpm-dev \
                      libgd3 \
                      libid3tag0-dev \
                      libmad0 \
                      libmad0-dev \
                      libsndfile1 \
                      libsndfile1-dev \
                      make

RUN git clone https://github.com/bbcrd/audiowaveform.git \
        && cd audiowaveform \
        && mkdir build \
        && cd build \
        && cmake -D ENABLE_TESTS=0 .. \
        && make install \
        && cd .. \
        && rm -rf audiowaveform

ENTRYPOINT ["audiowaveform"]
CMD ["--help"]
