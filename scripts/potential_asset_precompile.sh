#!/bin/bash

if [ $# -eq 0 ] || [ $1 != "not" ] ; then
  echo 'precompiling assets'
  RAILS_ENV=production rake assets:precompile
else
  echo "argument is not, so not running precompile"
fi
