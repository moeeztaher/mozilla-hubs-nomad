#!/bin/bash

# Download and install Prometheus
curl -LO https://github.com/prometheus/prometheus/releases/download/v2.47.0/prometheus-2.47.0.linux-amd64.tar.gz
tar xvf prometheus-2.47.0.linux-amd64.tar.gz
sudo mv prometheus-2.47.0.linux-amd64/prometheus /usr/local/bin/
sudo mv prometheus-2.47.0.linux-amd64/promtool /usr/local/bin/
sudo mv prometheus-2.47.0.linux-amd64/{consoles,console_libraries,prometheus.yml} /etc/prometheus/
rm -rf prometheus-2.47.0.linux-amd64 prometheus-2.47.0.linux-amd64.tar.gz
