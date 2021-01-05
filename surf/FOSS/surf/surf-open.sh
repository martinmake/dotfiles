#!/bin/sh
#
# See the LICENSE file for copyright and license details.
#

xidfile="$HOME/tmp/tabbed-surf.xid"
uri=""

if [ "$#" -gt 0 ]; then
	uri="$1"
fi

if [ ! -r "$xidfile" ];
then
	runtabbed
else
	xid=$(cat "$xidfile")
	if ! xprop -id "$xid" >/dev/null 2>&1; then
		tabbed -dn tabbed-surf -r 2 surf -e '' "$uri" >"$xidfile" 2>/dev/null &
	else
		surf -e "$xid" "$uri" >/dev/null 2>&1 &
	fi
fi

