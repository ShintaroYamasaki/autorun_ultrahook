#!/bin/bash

ULTRAHOOKPID=`ps -x | grep "/usr/local/bin/ultrahook" | grep -v grep | awk '{print $1}'`

if [ -z $ULTRAHOOK_TOKEN ]; then
  echo 'Token is NOT set.'
  exit
fi

echo $ULTRAHOOKPID

# Check ultrahook process
if [ "$ULTRAHOOKPID" != "" ]; then
  kill $ULTRAHOOKPID
fi

/usr/local/bin/ultrahook -k $ULTRAHOOK_TOKEN stripe 3000 &
