job "mozilla-hubs" {
  datacenters = ["dc1"]
  
  group "hubs" {
    network {
      mode = "bridge"
      port "hubs_http" {
        static = 3000
      }
    }

    task "hubs" {
      driver = "docker"

      config {
        image = "mozilla/hubs"
        ports = ["hubs_http"]
      }

      resources {
        cpu    = 500
        memory = 512
      }

      volume_mount {
        volume      = "hubs_data"
        destination = "/data"
      }
    }

    volume "hubs_data" {
      type      = "host"
      read_only = false
      source    = "/opt/nomad/hubs_data"
    }
  }
}
