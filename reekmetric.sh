#!/bin/bash
#
# Reek metric version 0.1
# Author: David Padilla
#
# Requires the reek gem
#
# To install it use:
#
# sudo gem install reek
#

if [ "$1" = "detailed" ]
then
  find app -name "*.rb" | xargs reek
else
  if [ -d "app" ]
    then
      for m in "(Duplication)" "(Uncommunicative Name)" "(Feature Envy)" "(Nested Iterators)" "(Long Method)" "(Utility Function)" "(Control Couple)" "(Nested Iterators)" "(Long Parameter List)" "(Control Couple)" "(Large Class)"
      do
        echo "$m: "
        find app -name "*.rb" | xargs reek | grep "$m" | wc -l
    done
  else
    echo "No app folder found. Not a Rails app? or Make sure you are running the script on RAILS_HOME"
  fi
fi


