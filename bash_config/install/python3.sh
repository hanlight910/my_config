# python3 source link
LINK=https://www.python.org/ftp/python/3.13.2/Python-3.13.2.tar.xz
wget $LINK
PYTHON_NAME=$(basename "$LINK")
tar -xf $PYTHON_NAME
rm $PYTHON_NAME

PYTHON_NAME=${PYTHON_NAME%.*}
PYTHON_NAME=${PYTHON_NAME%.*}

cd $PYTHON_NAME
./configure --enable-optimizations
sudo make install
cd ..
sudo rm -rf $PYTHON_NAME 
