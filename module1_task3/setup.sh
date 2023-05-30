#!/bin/bash

# Update package list and install required packages
apt-get update && apt-get install -y hugo make

# Execute the make build command and capture the output and error
output=$(make build 2>&1)

# Print the output and error
echo "$output"

# Check if the error message exists in the output and exit with the error code
if [[ "$output" == *"recipe for target 'build' failed"* ]]; then
  exit 255
fi
