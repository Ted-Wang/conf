#!/bin/bash

# When Linux OS installed with English as default language, the Chinese character may be displayed incorrect due to the wrong font fallback priority.
echo correct font fall back
sudo cp /etc/fonts/conf.avail/64-language-selector-prefer.conf /etc/fonts/conf.avail/64-language-selector-prefer.conf.bak
sudo sh -c 'sudo cat ./linux/64-language-selector-prefer.conf > /etc/fonts/conf.avail/64-language-selector-prefer.conf'
sudo fc-cache -fv
