#!/bin/bash

sudo rsync -av --delete $ARCHIVE_PATH/ /var/backups/archive.backup/
