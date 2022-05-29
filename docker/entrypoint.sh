#!/bin/bash

# Default to 'studio' if no arguments are provided
args="$@"
if [ -z "$args" ]; then
  args="DSView"
fi

exec $args

