#!/bin/bash

find "$(pwd)" -name "$(ls -t "$(pwd)" | head -n 1)"
