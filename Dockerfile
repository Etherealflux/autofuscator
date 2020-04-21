FROM ubuntu:18.04 AS compiler


RUN apt-get update
RUN apt-get install -y --no-install-recommends gcc build-essential git make
RUN apt-get install -y ca-certificates
RUN apt-get install -y m4

WORKDIR /root

RUN git clone https://github.com/csmith-project/csmith.git
RUN cd csmith && ./configure && make -j8
RUN pwd 

FROM ubuntu:18.04 AS generator
RUN apt-get update && apt-get install -y --no-install-recommends gcc build-essential unzip curl
WORKDIR /root

COPY *.sh ./
COPY tigress-3.1-bin.zip .
COPY --from=compiler /root/csmith/ ./csmith
RUN cp csmith/src/csmith /usr/bin/csmith

ENV CSMITH_HOME /root/csmith
ENV CSMITH_RUNTIME ${CSMITH_HOME}/runtime

RUN unzip tigress-3.1-bin.zip

ENV TIGRESS_HOME /root/tigress/3.1
ENV TIGRESS_RUNTIME /root/tigress/3.1

ENV PATH ${TIGRESS_HOME}:${PATH}

CMD /bin/sh
