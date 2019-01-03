#!/bin/sh

echoStep() {
	echo -e "\e[33m== $1 ==\e[0m"
}

safeln() {
	mkdir -p `dirname $2`
	rm $2
	ln -fs $1 $2
}

sudosafeln() {
	sudo mkdir -p `dirname $2`
	sudo rm $2
	sudo ln -fs $1 $2
}