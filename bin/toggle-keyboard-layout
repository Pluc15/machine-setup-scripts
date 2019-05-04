#!/bin/sh
if setxkbmap -print -verbose 10 | grep -x "layout.*ca"
then
    setxkbmap -layout us
else
    setxkbmap -layout ca -variant fr
fi