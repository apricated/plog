#!/bin/sh
# PERSONAL LOG / PLOG? #
#
function LO()
{
# 	Flag -c at $1 sets $2 to value prepending any following entries
	if [ "${1}" == '-c' ]; then
		echo "" >> $HOME/Documents/mclog.txt;
		CONTEXT="${2}: ";
#	Check value of prepended header, if any
	elif [ "${1}" == '-w' ]; then
		echo ${CONTEXT};
#	Clear value of prepended header, if any
	elif [ "${1}" == '-x' ]; then
		unset CONTEXT;
#	Add entry, with prepended header, if any
	else
		BODY="${@}" && echo "$(date) ${CONTEXT:-}${BODY}" >> $HOME/Documents/mclog.txt && tail -1 $HOME/Documents/mclog.txt;
	fi
	unset BODY;
}
#	Tail last 10 lines or number of lines specified
function TOL()
{
	[[ -n "$1" ]] && LINES="-n ${1} ";
	tail ${LINES-} "$HOME/Documents/mclog.txt";
}
alias OL='cat $HOME/Documents/mclog.txt';
alias NOL='nano $HOME/Documents/mclog.txt';
alias STRIKE="sed -i '' -e '$ d' $HOME/Documents/mclog.txt";
alias REPEAT="tail -1 $HOME/Documents/mclog.txt";
