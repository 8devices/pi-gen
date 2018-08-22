set -e

TMP_BUILD_DIR=`mktemp -d`

# Build ulfius
cd $TMP_BUILD_DIR
git clone -b v2.3.2 --single-branch https://github.com/babelouest/ulfius.git
cd ulfius/
git submodule update --init
cd lib/orcania
make && sudo make install
cd ../yder
make && sudo make install
cd ../..
make && sudo make install

# Build libjwt
cd $TMP_BUILD_DIR
git clone -b v1.9.0 --single-branch https://github.com/benmcollins/libjwt.git
cd libjwt
autoreconf -i
./configure
make && sudo make install

# Build restserver
cd $TMP_BUILD_DIR
git clone -b v1.0.1 --single-branch https://github.com/8devices/wakaama.git
cd wakaama
mkdir -p build && cd build && cmake ../examples/rest-server && make
install -m 755 restserver /usr/local/sbin/
systemctl enable restserver
