FROM gcc:6

RUN wget https://github.com/Kitware/CMake/releases/download/v3.15.5/cmake-3.15.5-Linux-x86_64.sh \
      -q -O /tmp/cmake-install.sh \
      && chmod u+x /tmp/cmake-install.sh \
      && mkdir /usr/bin/cmake \
      && /tmp/cmake-install.sh --skip-license --prefix=/usr/bin/cmake \
      && rm /tmp/cmake-install.sh

ENV PATH="/usr/bin/cmake/bin:${PATH}"
COPY mDNS-hub /hub
WORKDIR ./hub
RUN cmake .
RUN make all
RUN ls -laR ./src
#CMD ["./src/mdnshubd -f eth0 eth1"]
CMD tail -f /dev/null
