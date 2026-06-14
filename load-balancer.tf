# Target Group
resource "yandex_alb_target_group" "web" {
  name = "web-target-group"

  target {
    ip_address = yandex_compute_instance.web1.network_interface[0].ip_address
    subnet_id  = yandex_vpc_subnet.private.id
  }

  target {
    ip_address = yandex_compute_instance.web2.network_interface[0].ip_address
    subnet_id  = yandex_vpc_subnet.private.id
  }
}

# Backend Group
resource "yandex_alb_backend_group" "web" {
  name = "web-backend-group"

  http_backend {
    name             = "http-backend"
    weight           = 1
    port             = 80
    target_group_ids = [yandex_alb_target_group.web.id]
  }
}

# HTTP Router
resource "yandex_alb_http_router" "web" {
  name = "web-http-router"
}

resource "yandex_alb_virtual_host" "web" {
  name           = "web"
  http_router_id = yandex_alb_http_router.web.id

  route {
    name = "main"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.web.id
      }
    }
  }
}

# Application Load Balancer
resource "yandex_alb_load_balancer" "web" {
  name       = "web-alb"
  network_id = yandex_vpc_network.main.id

  allocation_policy {
    location {
      zone_id   = var.zone_a
      subnet_id = yandex_vpc_subnet.public.id
    }
  }

  listener {
    name = "http-listener"
    endpoint {
      address {
        external_ipv4_address {}
      }
      ports = [80]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.web.id
      }
    }
  }
}