#!/bin/sh
#

[ $# -lt 3 ] && echo "$0 {HOST} {USER} {PASSWORD}" && exit 127

host=$1
user=$2
pasw=$3

xfreerdp /cert:ignore /u:${user} /p:${pasw} /v:${host}:3389
