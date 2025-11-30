#!/bin/bash
set -e

# Change the ownership of the Docker socket using sudo
if [ -S /var/run/docker.sock ]; then
    sudo chown root:docker /var/run/docker.sock
fi

# Execute the main container command
exec "$@"
