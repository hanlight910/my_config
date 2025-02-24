# https://github.com/Genymobile/scrcpy/blob/master/doc/linux.md

# for Debian/Ubuntu
sudo apt install ffmpeg libsdl2-2.0-0 adb wget \
                 gcc git pkg-config meson ninja-build libsdl2-dev \
                 libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev \
                 libswresample-dev libusb-1.0-0 libusb-1.0-0-devk -Y


git clone https://github.com/Genymobile/scrcpy
cd scrcpy
./install_release.sh

cd .. 
rm -r scrcpy

