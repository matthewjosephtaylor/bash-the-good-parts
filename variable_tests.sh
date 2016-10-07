#/bin/bash

# I was confused for a long time about how export worked because the name
# is horrible. So please read the following if you wish to avoid some pain.
#
# One naturally assumes 'export' to mean to make availabe to the outside world.
# As in the world _external_ to yourself.
# One doesn't say if one is living in Texas that they are going to
# 'export' their goods to Dallas, because Dallas is considered internal to Texas.
# Yet this is what 'export' means for bash.
# The export keyword 'exports' the variable to CHILD processes ONLY.
# One can NEVER 'export' a variable to a PARENT process. The reason why this
# is so is sound: In the c/unix world children are separate processes that
# do not have direct access to the parent's memory (which in general is a good thing).
#
# So the real problem with the export keyword is with the connotation of the word
# used not the functionality. IMHO a better word would have been 'feed'. To me
# this brings up imagery of forced sharing to a particular chosen individual or group.
# Think of 'feeding a child' and how that makes more sense than 'exporting to a child'
# So whenever you see the word 'export' think the word 'feed' and hopefully
# this will help your intuition about what is happening.

# Variable scopes
# 1. 'Global' aka 'Environment variables' available both internal to the script
# and outside of it.
# 2. 'Shell variables' (sometimes losely called 'local variables' but don't
# confuse them with _true_ local variables) available only inside the context of
# the script or shell.
# 3. 'Local variables' available only within the specified context (usually a
# function) prefixed with the keyword 'local' when they are declared.

# Variable Types
# the 'declare' keyword is the most flexible but try to use the more readible
# versions if they exist and do what you want (readonly, export)
# 1. Shell variable String or Any type
a="this is a string"
# 2. Integer only
declare -i i=123
# 3. Constant
readonly PI="3.14"
# 4. Indexed Array only
declare -a planets=(Jupiter Mars Earth) #
# 5. Associative Array (Only available from Bash 4 onwards, and OSX is still on
# Bash 3 so for now I'm going to consider it off limits but should be available
# in the future hopefully)
# 6. exported constant variable
declare -x -r GUIDE_VERSION="v0.01"
# If you are OK with an environment variable being overwritten then use the simpler
export TEST_PATH="./:./tests"

# Naming conventions
#
# Like all programming languages Bash has conventions for how one should name things.
# Sometimes those conventions are arbitrary and sometimes there are good reasons
# why one should obey the rules. Remember also that sometimes one person's
# arbitrary is another's good reason and vice versa, but consistency is
# generally preferred by everyone so OBEY THE RULES unless you have a good
# reason not to.
#
# Rule #1: Use snake_case
# Rule #2: CAPITALS are for constants and environment variables ONLY
# Rule #3: THERE IS NO RULE 3!
# Rule #4: Lower case your non-constant non-exported variables within a script
#
# Why CAPITALS are for environment vairables only
# http://unix.stackexchange.com/a/121126
# Google's Style Guide https://google.github.io/styleguide/shell.xml
