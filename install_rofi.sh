sudo apt install -y flex bison \
    librsvg2-dev

cd ~/Public
git clone --recursive https://github.com/DaveDavenport/rofi
cd rofi/
autoreconf -i

mkdir build
cd build
../configure --disable-check
make
sudo make install
