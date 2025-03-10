RECORDING_PATH="./status.csv"
if [ ! -f $RECORDING_PATH ]; then
	echo "Active,Sleep" > "$RECORDING_PATH"
fi

DATE_FORMAT="$(date +"%Y-%m-%d %H:%M:%S")"
echo "$DATE_FORMAT"
