DIRECTORY_NAME=$1
mkdir -p $DIRECTORY_NAME
cd $DIRECTORY_NAME
echo $(pwd)
python3 -m venv venv
source ./venv/bin/activate
