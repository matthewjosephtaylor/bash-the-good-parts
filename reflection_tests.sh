#/bin/bash

SELF=$(<$0)

# echo "entire script: '${SELF}'"

function reflector () {
	local self=$(declare -f "${FUNCNAME[0]}")
	# local self=$(<$0)

	echo "just function: '${self}'"
}

echo "-------------------"

# reflector

# compgen is awsome for discovering what is available
# https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html

# list all the functions
compgen -A function
#alternative: declare -F

# list all the variables
compgen -A variable
echo "exports------------------------"
compgen -A export
