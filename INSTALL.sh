#!/bin/sh

scriptdir="$HOME/.local/bin"

find . -type f \
	-not -path "*.git/*" \
	-not -name "README.md" \
	-not -name "INSTALL.sh" \
	-exec cp "{}" "$scriptdir" \;
