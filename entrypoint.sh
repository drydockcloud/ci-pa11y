#!/bin/bash
set -e

args=( "$@" )

if [ "${TARGET}" != "" ]; then
  export PA11Y_baseUrl="${TARGET}"
fi

# If the first argument is pa11y, then remove it.
if [ "${args[0]}" == "pa11y" ]; then
  args=( "${args[@]:1}" )
fi

# Run if Drydock "autotest" command is provided.
if [ "${args[0]}" == "autotest" ]; then
  args[0]="run"
fi

# Re-execute with provided args
exec pa11y "${args[@]}"

