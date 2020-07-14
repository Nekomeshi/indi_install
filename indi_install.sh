#!/bin/bash

#indi core 
cd
sudo apt-get install -y libnova-dev libcfitsio-dev libusb-1.0-0-dev zlib1g-dev libgsl-dev build-essential cmake git libjpeg-dev libcurl4-gnutls-dev libtiff-dev libfftw3-dev
git clone https://github.com/indilib/indi.git
cd indi
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ..
make -j4
sudo make install

#indi lib/driver
cd
sudo apt-get -y install libnova-dev libcfitsio-dev libusb-1.0-0-dev zlib1g-dev libgsl-dev build-essential cmake git libjpeg-dev libcurl4-gnutls-dev libtiff-dev libfftw3-dev libftdi-dev libgps-dev libraw-dev libdc1394-22-dev libgphoto2-dev libboost-dev libboost-regex-dev librtlsdr-dev liblimesuite-dev libftdi1-dev libavcodec-dev libavdevice-dev
sudo apt-get install libnova-dev libcfitsio-dev libusb-1.0-0-dev zlib1g-dev libgsl-dev build-essential cmake git libjpeg-dev libcurl4-gnutls-dev libtiff-dev libftdi-dev libgps-dev libraw-dev libdc1394-22-dev libgphoto2-dev libboost-dev libboost-regex-dev librtlsdr-dev liblimesuite-dev libftdi1-dev
git clone https://github.com/indilib/indi-3rdparty

#indi lib
cd indi-3rdparty
mkdir build_lib
cd build_lib
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug -DBUILD_LIBS=1 ..
make -j4
sudo make install

#indi driver
cd ..
mkdir build_driver
cd build_driver
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ..
make -j4
sudo make install
cd

#kstars
#sudo apt-add-repository -y ppa:mutlaqja/ppa
#sudo apt-get update
#sudo apt-get install -y kstars-bleeding
sudo apt-get -y install build-essential cmake git libeigen3-dev libcfitsio-dev zlib1g-dev libindi-dev extra-cmake-modules libkf5plotting-dev libqt5svg5-dev libkf5xmlgui-dev kio-dev kinit-dev libkf5newstuff-dev kdoctools-dev libkf5notifications-dev qtdeclarative5-dev libkf5crash-dev gettext libnova-dev libgsl-dev libraw-dev libkf5notifyconfig-dev wcslib-dev libqt5websockets5-dev xplanet xplanet-images qt5keychain-dev libsecret-1-dev breeze-icon-theme
git clone https://invent.kde.org/education/kstars.git
cd kstars
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
make -j4
sudo make install

#indi-web
sudo apt-get install -y python3-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python3-setuptools
sudo -H pip3 install indiweb

echo "[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=indi-Web
Comment=pasystray
Exec=indi-web
OnlyShowIn=XFCE;
StartupNotify=false
Terminal=false
Hidden=false" > ~/.config/autostart/indiweb.desktop

#astrometry
sudo apt install -y astrometry.net
cd /usr/share/astrometry

sudo wget  --continue http://data.astrometry.net/4200/wget.sh   
sudo chmod a+x wget.sh
sudo ./wget.sh


cd
wget http://astrometry.net/downloads/astrometry.net-latest.tar.gz
tar xvzf astrometry.net-latest.tar.gz
cd astrometry.net-0.80

#opencv
cd
sudo apt-get -y install build-essential checkinstall cmake unzip pkg-config yasm
sudo apt-get -y install git gfortran python3-dev
sudo apt-get -y install libjpeg8-dev libjasper-dev libpng12-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine2-dev libv4l-dev
sudo apt-get -y install libjpeg-dev libpng-dev libtiff-dev libtbb-dev
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libatlas-base-dev libxvidcore-dev libx264-dev libgtk-3-dev
sudo apt-get -y install qt5-default

git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git

cd opencv
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=Release \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D WITH_TBB=ON \
-D WITH_QT=ON \
-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules ..
make -j4

sudo make install

