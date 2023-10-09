#!/bin/bash
parent_path=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
"$parent_path"/pull.sh
alias usage="cat \"$(echo "$parent_path"/../USAGE.md)\""
cat "$parent_path"/../USAGE.md
echo -e "\nYou can review this notice at any time by typing 'usage' into your terminal.\n"

if [ ! -f ~/.cybersoc/agreed ]; then
	while true; do
		read -p "Have you read and do you agree to the above notice? (y/n) " yn

		case $yn in 
			[yY] ) touch ~/.cybersoc/agreed;
				break;;
			[nN] ) echo "You must agree to continue.";;
			* ) echo "Invalid response, please type y or n.";;
		esac
	done
fi
