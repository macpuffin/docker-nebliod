FROM macpuffins/buildpack-deps-rpi:latest
MAINTAINER macpuffins <dev@macpuffins.com>


ENTRYPOINT cd $HOME \
    && export PATH=/usr/lib/ccache:$PATH \
    && export CCACHE_DIR=/root/vol/deploy/.ccache \
    && export CCACHE_COMPRESS=1 \
	&& export CCACHE_COMPRESSLEVEL=9 \
	&& export CCACHE_MAXSIZE=150M \
    && cd /root/vol \
    && export OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/ \
    && export OPENSSL_LIB_PATH=$HOME/openssl_build/lib/ \
    && export PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/ \
    && export BOOST_INCLUDE_PATH="$(pwd)/boost_build/include/" \
    && export BOOST_LIB_PATH="$(pwd)/boost_build/lib/" \
    && ccache -s \
    && if [ "$BUILD" = "macpuffinsd" ]; then cd /root/vol/wallet; fi \
    && if [ "$BUILD" = "macpuffinsd" ]; then make "lmdb32=1" "STATIC=1" -B -w -j2 -f makefile.unix; fi \
    && if [ "$BUILD" = "macpuffinsd" ]; then strip macpuffinsd; fi \
    && if [ "$BUILD" = "macpuffinsd" ]; then cp ./macpuffinsd /root/vol/deploy/macpuffinsd; fi \
    && if [ "$BUILD" = "macpuffins-qt" ]; then cd /root/vol; fi \
    && if [ "$BUILD" = "macpuffins-qt" ]; then qmake "USE_UPNP=1" "USE_QRCODE=1" "RELEASE=1" "OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/" "OPENSSL_LIB_PATH=$HOME/openssl_build/lib/" "PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/" "QRENCODE_INCLUDE_PATH=$HOME/qrencode_build/include/" "QRENCODE_LIB_PATH=$HOME/qrencode_build/lib/" "BOOST_INCLUDE_PATH=$(pwd)/boost_build/include/" "BOOST_LIB_PATH=$(pwd)/boost_build/lib/" macpuffins-wallet.pro; fi \
    && if [ "$BUILD" = "macpuffins-qt" ]; then make -B -w -j2; fi \
    && if [ "$BUILD" = "macpuffins-qt" ]; then cp ./wallet/macpuffins-qt /root/vol/deploy/macpuffins-qt; fi \
    && if [ "$BUILD" = "tests-macpuffins-qt" ]; then cd /root/vol; fi \
    && if [ "$BUILD" = "tests-macpuffins-qt" ]; then qmake "USE_UPNP=1" "USE_QRCODE=1" "RELEASE=1" "OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/" "OPENSSL_LIB_PATH=$HOME/openssl_build/lib/" "PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/" "QRENCODE_INCLUDE_PATH=$HOME/qrencode_build/include/" "QRENCODE_LIB_PATH=$HOME/qrencode_build/lib/" "BOOST_INCLUDE_PATH=$(pwd)/boost_build/include/" "BOOST_LIB_PATH=$(pwd)/boost_build/lib/" "MACPUFFINS_CONFIG += NoWallet" macpuffins-wallet.pro; fi \
    && if [ "$BUILD" = "tests-macpuffins-qt" ]; then make -B -w -j2; fi \
    && if [ "$BUILD" = "tests-nebmacpuffinslio-qt" ]; then touch ./wallet/macpuffins-qt.running-tests; fi \
    && if [ "$BUILD" = "tests-macpuffins-qt" ]; then ./wallet/test/macpuffins-tests --gtest_filter=-ntp1_tests.run_parse_test:ntp1_tests.download_premade_data_to_files_and_run_parse_test; fi \
    && if [ "$BUILD" = "tests-macpuffins-qt" ]; then cp ./wallet/macpuffins-qt.running-tests /root/vol/deploy/tests-macpuffins-qt; fi \
    && ccache -s
