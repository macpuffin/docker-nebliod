FROM balenalib/raspberry-pi-debian:stretch
MAINTAINER macpuffin <dev@macpuffins.com>

RUN [ "cross-build-start" ]

COPY --from=macpuffins/macpuffinsd-build-rpi:latest /bin/macpuffinsd /bin/macpuffinsd

ADD ./bin /usr/local/bin
RUN chmod 755 /usr/local/bin/macpuffins_init /usr/local/bin/run_macpuffins

EXPOSE 1784 1820

VOLUME /root/.macpuffins

CMD ["run_macpuffins"]

RUN [ "cross-build-end" ]
