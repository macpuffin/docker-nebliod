FROM ubuntu:xenial
MAINTAINER MacPuffin <dev@macpuffins.com>

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y ca-certificates

COPY --from=macpuffin/macpuffinsd-build:latest /bin/macpuffinsd /bin/macpuffinsd

ADD ./bin /usr/local/bin
RUN chmod 755 /usr/local/bin/macpuffins_init /usr/local/bin/run_macpuffins

EXPOSE 6325 6326

VOLUME /root/.macpuffins

CMD ["run_macpuffins"]
