#
FROM debian:buster

RUN apt-get update
RUN apt-get -y install git clang cmake make gcc g++ libmariadbclient-dev libssl-dev libbz2-dev libreadline-dev libncurses-dev libboost-all-dev mariadb-server p7zip default-libmysqlclient-dev
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang 100
RUN apt-get clean

#RUN mkdir -p /vnc/.local/share/data/qBittorrent
RUN mkdir -p /wow/src
ADD build.sh /wow/build.sh
RUN chmod +x /wow/build.sh
RUN /wow/build.sh