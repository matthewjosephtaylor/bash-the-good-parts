#/bin/bash

function hello () {
	echo "hi $@"
}

hello tom

hello tom dick harry

partial=(hello betty)

${partial[@]}

${partial[@]} sue marry

function introduction () {
	echo "It is my utmost pleaseure to say"
	$@
	echo "to you"
}

introduction "hello" "Mr. President"

introduction ${partial[@]}

introduction ${partial[@]} susan marrypenny

function chat () {
	echo "Well look who it is!"
	greeting_complex_function=${@:1:2}
	${greeting_complex_function} ${@:3:1}
	${greeting_complex_function} ${@:4:1}
	echo "Been nice chatting!"
}

chat introduction hello "Sam, you old dog"

chat introduction hello "Sam, you old dog" "Charlotte, you hip cat"
