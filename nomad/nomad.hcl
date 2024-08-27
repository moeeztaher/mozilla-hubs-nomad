log_level = "INFO"
plugin "docker" {
  config {
    volumes {
      enabled = true
    }
  }
}

data_dir = "/opt/nomad/data"
bind_addr = "0.0.0.0"

server {
  enabled          = true
  bootstrap_expect = 1
}

client {
  enabled = true
  network_interface = "eth0"
}
