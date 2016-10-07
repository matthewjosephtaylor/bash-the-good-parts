#/bin/bash
#set -x

function foo () {
	local locA="foo local"
	echo "from top: '${locA}'"
	(
		echo "from subshell: '${locA}'"
		locA="changed"
	)
	echo "from outside after change attempt in subshell: '${locA}'"
	{
		echo "from brace subthingy: '${locA}'"
		locA="changed"
	}
	echo "from outside after change attempt in bracethingy: '${locA}'"

	local result=$(echo "from dollar subshell: '${locA}'")
	echo "result value: '${result}'"
}

foo
echo "from outside function: '${locA}'"
