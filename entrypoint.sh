#!/bin/bash
set -e

args=( "$@" )

# If the first argument is pa11y-ci, then remove it.
if [ "${args[0]}" == "pa11y-ci" ]; then
  args=( "${args[@]:1}" )
fi

# Run if Drydock "autotest" command is provided.
if [ "${args[0]}" == "autotest" ]; then
  args[0]="-c"
  args[1]="pa11yci.conf.js"
fi

# Re-execute with dumb init and provided args
exec dumb-init pa11y-ci "${args[@]}"