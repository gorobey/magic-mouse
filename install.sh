#!/bin/bash

# are you root?
if [ "x$(id -u)" != 'x0' ]; then
    echo 'Error: this script can only be executed by root'
    exit 1
fi

# Check curl
if [ -e '/usr/bin/curl' ]; then
    curl -O https://raw.githubusercontent.com/gorobey/magic-mouse/696a9afb28b078bbce316197961ddf8c07658274/magic_mouse
    curl -O https://raw.githubusercontent.com/gorobey/magic-mouse/696a9afb28b078bbce316197961ddf8c07658274/autorun    
    if [ "$?" -eq '0' ]; then
        mv magic_mouse /usr/bin/magic_mouse
        mv autorun /etc/profile.d/magic_mouse_autorun
        rm install.sh
        exit
    else
        echo "Error: download failed."
        exit 1
    fi
fi
