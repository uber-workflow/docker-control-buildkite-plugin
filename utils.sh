#!/bin/bash

# retry <number-of-retries> <command>
function retry {
  local retries=$1; shift
  local attempts=1
  local status=0

  until "$@"; do
    status=$?
    echo "Exited with $status"
    if (( retries == "0" )); then
      return $status
    elif (( attempts == retries )); then
      echo "Failed $attempts retries"
      return $status
    else
      echo "Retrying $((retries - attempts)) more times..."
      attempts=$((attempts + 1))
      sleep $(((attempts - 2) * 2))
    fi
  done
}
