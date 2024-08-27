#!/bin/bash

# Download and install Nomad
curl -fsSL https://releases.hashicorp.com/nomad/1.7.3/nomad_1.7.3_linux_amd64.zip -o nomad.zip
unzip nomad.zip
sudo mv nomad /usr/local/bin/
rm nomad.zip
