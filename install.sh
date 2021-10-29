#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# $1    -> desired file location
main() {
	FILE="$HOME/.tmux.conf"
	if [[ $# -gt 0 ]]; then
		FILE="$1"
	fi
	
	if file_exists $FILE; then
		backup_file $FILE
	fi
	place_file $FILE
}

# $1    -> desired file location
file_exists() {
	[ -f "$1" ]
}

# $1    -> desired file location
place_file() {
	cp "$SCRIPT_DIR/tmux.conf" "$1"
}

# $1    -> file to back up
backup_file() {
	mv $1 "$1.old"
}

main $@

