#!/bin/bash

# Create necessary directories
sudo mkdir -p /etc/nomad.d /opt/nomad/data

# Copy the Nomad configuration file
sudo cp nomad.hcl /etc/nomad.d/nomad.hcl

# Create the volume directory
sudo mkdir -p /opt/nomad/hubs_data

# Create a systemd service for Nomad
sudo tee /etc/systemd/system/nomad.service > /dev/null <<EOL
[Unit]
Description=Nomad Agent
Documentation=https://www.nomadproject.io/docs/
After=network-online.target

[Service]
ExecStart=/usr/local/bin/nomad agent -config=/etc/nomad.d/nomad.hcl
ExecReload=/bin/kill -HUP \$MAINPID
KillMode=process
KillSignal=SIGINT
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOL

# Start and enable Nomad service
sudo systemctl daemon-reload
sudo systemctl start nomad
sudo systemctl enable nomad
