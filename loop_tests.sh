#/bin/bash
function count () {
	# for ((i=1; i<10; i++)) {
	# 	echo "index: ${i}"
	# }
	(
		for ((i=1; i<10; i++)) do
			(echo "index: ${i}")
		done
	)

}

# function condition () {
# 	local a=2
# 	if (( a -eq 2 )); then
# 		echo "ha!"
# 	fi
# }


count
echo "last i: ${i}"
# condition
