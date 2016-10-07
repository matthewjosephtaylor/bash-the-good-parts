#/bin/bash

# create an inline multiline document
document=$(cat <<EOF
John Ran
Sue Jumped
Bian Leaped
Sam Stayed Home
EOF)

echo "${document}"

# pipe the multiline document to while-read pattern
echo "${document}" | while read line; do
	echo "I'm reading: ${line}"
done

# read each line from file
while read line; do
	echo "I'm reading: ${line}"
done <sample.txt
