#!/usr/bin/env bash

cp -Lr ~/.config/awesome/ /tmp/awesome-dev # copy following links
chmod -R +w /tmp/awesome-dev               # add write flag
rm -rf ~/.config/awesome/                  # replace config with fully populated files
mv /tmp/awesome-dev ~/.config/awesome/
