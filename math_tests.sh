#!/bin/bash

# Bash natively handles integer arithmetic ONLY
# older let and new double brace
# double brace is more readible and is so preferred
a=123
b="456"

result=$((a+b))

echo "result: ${result}"

# bc is the most often used substitute for floating point and has arbitrary
# precision which is more powerful than math in most general purpose languages

result=$(echo "1+2.364654648798746342123145" | bc)
echo "result: ${result}"

# load a math library for slightly more complex functions
result=$(echo "s(l(1+2.364654648798746342123145))" | bc -l)
echo "result: ${result}"

# It's trivial to build your own math function so not a huge burden
# BYOM  (Bring Your Own Math)

function m () {
	echo "${@}" | bc -l
}

result=$(m 1 / 3)
echo "result: ${result}"

# yes math as a service is a thing :)
function m2 () {
	curl --get --data-urlencode "expr=${@}" "http://api.mathjs.org/v1/" 2>/dev/null
}

result=$(m2 1 / 3)
echo "result: ${result}"

# more complex, requires quotes because of '()'
result=$(m2 "sin(45 deg)")
echo "result: ${result}"

#ternary aka trinary aka elvis operator is available
a=5
((t = a<7?7:11))   # True
echo "ternary result: ${t}"  # 7
