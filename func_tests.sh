#/bin/bash
#set -x

poor_man_closure_id=""

function foo () {
	local sleepSecs="2"
	(

	while [ 1 ]; do
	echo "sleeping for: $sleepSecs"
	sleep "$sleepSecs"
	done
	# local jobNum=$!
	# echo "jobs from subshell in foo"
	# jobs
	# local locA="foo local"
	# # function foo-prime () {  echo "do I have access to locA? ${locA}";  }
	# local funcVar="function foo-prime () {  echo \"do I have access to locA? ${locA}\";  }"
	# # local funcVar="function foo-prime () {  echo \"do I have access to locA? ${locA}\"  }"
	# #foo-prime
	#  eval "$funcVar ; foo-prime"
	#  eval "echo test"
	) &
	poor_man_closure_id=$!
	kill -SIGSTOP "${poor_man_closure_id}"
	sleep 1
	# kill -9 "${poor_man_closure_id}"
	echo "jobs from foo"
	jobs -l
}

foo
echo "jobs from outside foo"
sleep 1
jobs -l
echo "poor mans closure: ${poor_man_closure_id}"
kill -SIGCONT "${poor_man_closure_id}"
sleep 1
jobs -l
echo "killing poor mans closure: ${poor_man_closure_id}"
kill -SIGKILL "${poor_man_closure_id}"
echo "killed jobs"
sleep 1
jobs -l
