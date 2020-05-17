FROM balenalib/raspberry-pi-debian:buster
MAINTAINER macpuffin <dev@nmacpuffins.com>

RUN [ "cross-build-start" ]

COPY --from=macpuffin/macpuffinsd-build-rpi:latest /bin/macpuffinsd /bin/macpuffinsd
COPY --from=macpuffin/macpuffinsd-sync-testnet:latest /root/.macpuffins.bootstrapped /root/.macpuffins.bootstrapped

ADD ./bin /usr/local/bin
RUN chmod 755 /usr/local/bin/macpuffins_init /usr/local/bin/run_macpuffins

EXPOSE 1820 1784

VOLUME /root/.macpuffins

CMD ["run_macpuffins"]

RUN [ "cross-build-end" ]
