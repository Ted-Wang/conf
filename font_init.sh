#!/bin/bash

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# When Linux OS installed with English as default language, the Chinese character may be displayed incorrect due to the wrong font fallback priority.
echo correct font fall back
sudo \cp /etc/fonts/conf.avail/64-language-selector-prefer.conf /etc/fonts/conf.avail/64-language-selector-prefer.conf.bak
sudo sh -c 'sudo cat $BASE_DIR/linux_conf/64-language-selector-prefer.conf > /etc/fonts/conf.avail/64-language-selector-prefer.conf'
pamcan --help > /dev/null 2>&1
if [ $? == 0 ]; then
    # create symbol link for Manjaro
    sudo ln -s /etc/fonts/conf.avail/64-language-selector-prefer.conf /etc/fonts/conf.d/64-language-selector-prefer.conf
fi
sudo fc-cache -fv
