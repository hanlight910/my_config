#!/bin/bash

rsync -avz --progress "$1" "$DMSSH:/home/$NAME/projects/py_3.10/"
