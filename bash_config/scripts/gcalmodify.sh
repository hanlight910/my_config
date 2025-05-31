#!/bin/bash

gcalcli agenda
echo -n "Title: "
read title
gcalcli edit "$title"
