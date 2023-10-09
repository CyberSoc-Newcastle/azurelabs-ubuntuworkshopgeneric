#!/bin/bash
parent_path=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

"$parent_path"/pull.sh

if [ ! -f ~/.cybersoc/agreed ]; then
	while true; do
		if zenity --question --title="CyberSoc Lab VM Usage Policy" --text="$(cat "$parent_path"/../USAGE.md)\n\nHave you read and do you agree to the above notice?"; then
		    touch ~/.cybersoc/agreed;
		    break;
		else
		    zenity --error --text="You must agree to continue."
		fi
	done
else
	zenity --info --title="CyberSoc Lab VM Usage Reminder" --text="$(cat "$parent_path"/../USAGE.md)"
fi
