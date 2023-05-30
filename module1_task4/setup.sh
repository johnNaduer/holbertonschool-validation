#!/bin/bash

# Update package list and install required packages
apt-get update && apt-get install -y hugo make &> /dev/null
apt-get update && apt-get install -y wget git &> /dev/null

# Remove any older version of hugo
apt-get remove -y hugo

# Download Go version 1.20.4 && GoHugo version 0.84.0 binary files
wget https://go.dev/dl/go1.20.4.linux-amd64.tar.gz
wget https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.tar.gz

# Extract and move go binary to /usr/local
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.4.linux-amd64.tar.gz

# include /usr/local/go/bin in PATH
export PATH=$PATH:/usr/local/go/bin

# Extract GoHugo binary
tar -xzf hugo_extended_0.84.0_Linux-64bit.tar.gz

# Move GoHugo binary to PATH
mv hugo /usr/local/bin

# Clone git repo & move inside repo
#if [[ ! -d holbertonschool-validation ]]; then
#	git clone https://github.com/MiguelColmenares94/holbertonschool-validation
#fi

# Execute the make build command and capture the output and error
output=$(make build 2>&1)

# clean all downloaded files & directories
rm -rf go1.20.4.linux-amd64.tar.gz hugo_extended_0.84.0_Linux-64bit.tar.gz

# Print the output and error
echo "$output"

# Check if the error message exists in the output and exit with the error code
if [[ "$output" == *"recipe for target 'build' failed"* ]]; then
  exit 255
fi
