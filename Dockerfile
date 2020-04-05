#
FROM debian:buster

RUN apt-get update
RUN apt-get -y install git clang cmake make gcc g++ libmariadbclient-dev libssl-dev libbz2-dev libreadline-dev libncurses-dev libboost-all-dev mariadb-server p7zip default-libmysqlclient-dev
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang 100
RUN apt-get clean

#RUN mkdir -p /vnc/.local/share/data/qBittorrent
RUN mkdir -p /wow/src


Run cd /wow/src
Run git clone -b 3.3.5 git://github.com/TrinityCore/TrinityCore.git

RUN cd TrinityCore
RUN mkdir build
RUN cd build
RUN cmake ../ -DCMAKE_INSTALL_PREFIX=/wow
RUN make
RUN make install
