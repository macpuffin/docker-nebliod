FROM ubuntu:xenial
MAINTAINER macpuffins <dev@macpuffins.com>

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y ca-certificates

COPY --from=macpuffin/macpuffinsd-build:latest /bin/macpuffinsd /bin/macpuffinsd
COPY --from=macpuffin/macpuffinsd-sync-testnet:latest /root/.macpuffins.bootstrapped /root/.macpuffins.bootstrapped

RUN apt-get update && apt-get install -y wget

ADD ./bin /usr/local/bin
RUN chmod 755 /usr/local/bin/macpuffins_quicksync

RUN cd $HOME \
    && /usr/local/bin/macpuffins_quicksync
