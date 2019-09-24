#!/bin/bash

echo 'Running potential asset precompile'

if [ $1 == "not" ] ; then
  echo "argument == not, so not running precompile"
else
  echo 'no argument supplied or argument different from not, precompiling'
  RAILS_ENV=production rake assets:precompile
fi
