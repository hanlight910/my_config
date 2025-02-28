
if [ ! -t "venv" ]; then
	python3 -m venv venv
fi

. venv/bin/activate
