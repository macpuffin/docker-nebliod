FROM macpuffins/buildpack-deps-rpi:latest
MAINTAINER macpuffins <dev@macpuffins.com>

ARG GITHUB_SHA=1

RUN [ "cross-build-start" ]

RUN cd $HOME \
    && export PATH=/usr/lib/ccache:$PATH \
    && if [ "$GITHUB_SHA" != 1 ]; then git clone -n https://github.com/macpuffin/macpuffins; fi \
    && if [ "$GITHUB_SHA" = 1 ]; then git clone -b master https://github.com/macpuffin/macpuffins; fi \
    && if [ "$GITHUB_SHA" != 1 ]; then cd macpuffins && git checkout "${GITHUB_SHA}" && cd ..; fi \
    && export OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/ \
    && export OPENSSL_LIB_PATH=$HOME/openssl_build/lib/ \
    && export PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/ \
    && export BOOST_INCLUDE_PATH="$(pwd)/boost_build/include/" \
    && export BOOST_LIB_PATH="$(pwd)/boost_build/lib/" \
    && cd macpuffins/wallet \
    && ccache -s \
    && make "STATIC=1" -B -w -j2 -f makefile.unix \
    && ccache -s \
    && strip macpuffinsd \
    && cp ./macpuffinsd /bin/macpuffinsd \
    && cd $HOME \
    && cd macpuffins \
    && ccache -s \
    && qmake "USE_UPNP=1" "USE_QRCODE=1" "RELEASE=1" "OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/" "OPENSSL_LIB_PATH=$HOME/openssl_build/lib/" "PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/" "QRENCODE_INCLUDE_PATH=$HOME/qrencode_build/include/" "QRENCODE_LIB_PATH=$HOME/qrencode_build/lib/" "BOOST_INCLUDE_PATH=$(pwd)/boost_build/include/" "BOOST_LIB_PATH=$(pwd)/boost_build/lib/" macpuffins-wallet.pro \
    && make -B -w -j2 \
    && ccache -s \
    && cp ./wallet/macpuffins-qt /bin/macpuffins-qt \
    && ccache -s

RUN [ "cross-build-end" ]
