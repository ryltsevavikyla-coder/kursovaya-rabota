# Elasticsearch
resource "yandex_compute_instance" "elasticsearch" {
  name        = "elasticsearch"
  zone        = "ru-central1-b"
  folder_id   = "b1gqs3qvfova0eckiuqk"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8hrphlcsmi293sjc74"
      size     = 30
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.private.id
    security_group_ids = [yandex_vpc_security_group.monitoring.id]
  }

  metadata = {
    ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDN95FDf+20e+xsqksNEs8glHREaGATRYtpN8qEvMaJtD24mST5l0CWYv6JiSTgwxfhRpFjlz+Udc+r5MMVxWYquDNTvNF76j7yb7OIpk86LgU8BL7QSTf7oURRpUxklDvvq5SmLPn08jJoxKSWZmn87hZ9Kdb5U4kSNY4TQGQizgB/o4i9/5lGvJaucOq+vMS6iLSUZUGKcIB7WyXDPznh2E15F+EsH/Qxc6wzJqfMAbSLylpAeXykBaFZcRWHcJVdHl5D6fkd+nL9PHS/9QrXZNVjb+ThXGjUggDmrVpKJYQy2fnyCOe62c+nLTWwl8G2usLrscWwZpYDrwAsOFGKs3nhFzVkXF37L4mPPr1jNSXDBJFo+nrSSFWYIxC/WPtY5m/Aw3zb8IqTNo3+oISvtoR4wPCcxpyNDIzIJiqW1VSfm0B3mmKd6feA44yM8vI9hQY/xU22y8qtHYgNwZ8YRD+/st3LIHpax+ds7xJg47KFefJIcVPx5ZbkZr414Ps0KtRLc9fdymV9wKtv1rbwCL/yr/cLHK46slakLiewdiWdx02iXZR+rmARKwqp4YzA6vlI3OkmsnY+eofTugkqDKsIpMn1c3RnmEVKQb4K7PsfALGBXUQQsrEKBDYL9Gw5SRi6jbxfYXdguldTCvmRKy4LRX4Q984pMDw7EmScRw== devops-kurs"
  }
}

# Web Server 1
resource "yandex_compute_instance" "web1" {
  name        = "web-server-1"
  zone        = var.zone_b
  folder_id   = "b1gqs3qvfova0eckiuqk"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8hrphlcsmi293sjc74"
      size     = 20
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.private.id
    security_group_ids = [yandex_vpc_security_group.web.id]
  }

  metadata = {
    ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDN95FDf+20e+xsqksNEs8glHREaGATRYtpN8qEvMaJtD24mST5l0CWYv6JiSTgwxfhRpFjlz+Udc+r5MMVxWYquDNTvNF76j7yb7OIpk86LgU8BL7QSTf7oURRpUxklDvvq5SmLPn08jJoxKSWZmn87hZ9Kdb5U4kSNY4TQGQizgB/o4i9/5lGvJaucOq+vMS6iLSUZUGKcIB7WyXDPznh2E15F+EsH/Qxc6wzJqfMAbSLylpAeXykBaFZcRWHcJVdHl5D6fkd+nL9PHS/9QrXZNVjb+ThXGjUggDmrVpKJYQy2fnyCOe62c+nLTWwl8G2usLrscWwZpYDrwAsOFGKs3nhFzVkXF37L4mPPr1jNSXDBJFo+nrSSFWYIxC/WPtY5m/Aw3zb8IqTNo3+oISvtoR4wPCcxpyNDIzIJiqW1VSfm0B3mmKd6feA44yM8vI9hQY/xU22y8qtHYgNwZ8YRD+/st3LIHpax+ds7xJg47KFefJIcVPx5ZbkZr414Ps0KtRLc9fdymV9wKtv1rbwCL/yr/cLHK46slakLiewdiWdx02iXZR+rmARKwqp4YzA6vlI3OkmsnY+eofTugkqDKsIpMn1c3RnmEVKQb4K7PsfALGBXUQQsrEKBDYL9Gw5SRi6jbxfYXdguldTCvmRKy4LRX4Q984pMDw7EmScRw== devops-kurs"

    user-data = <<-EOT
      #cloud-config
      ssh_authorized_keys:
        - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDN95FDf+20e+xsqksNEs8glHREaGATRYtpN8qEvMaJtD24mST5l0CWYv6JiSTgwxfhRpFjlz+Udc+r5MMVxWYquDNTvNF76j7yb7OIpk86LgU8BL7QSTf7oURRpUxklDvvq5SmLPn08jJoxKSWZmn87hZ9Kdb5U4kSNY4TQGQizgB/o4i9/5lGvJaucOq+vMS6iLSUZUGKcIB7WyXDPznh2E15F+EsH/Qxc6wzJqfMAbSLylpAeXykBaFZcRWHcJVdHl5D6fkd+nL9PHS/9QrXZNVjb+ThXGjUggDmrVpKJYQy2fnyCOe62c+nLTWwl8G2usLrscWwZpYDrwAsOFGKs3nhFzVkXF37L4mPPr1jNSXDBJFo+nrSSFWYIxC/WPtY5m/Aw3zb8IqTNo3+oISvtoR4wPCcxpyNDIzIJiqW1VSfm0B3mmKd6feA44yM8vI9hQY/xU22y8qtHYgNwZ8YRD+/st3LIHpax+ds7xJg47KFefJIcVPx5ZbkZr414Ps0KtRLc9fdymV9wKtv1rbwCL/yr/cLHK46slakLiewdiWdx02iXZR+rmARKwqp4YzA6vlI3OkmsnY+eofTugkqDKsIpMn1c3RnmEVKQb4K7PsfALGBXUQQsrEKBDYL9Gw5SRi6jbxfYXdguldTCvmRKy4LRX4Q984pMDw7EmScRw== devops-kurs
    EOT
  }
}

# Web Server 2
resource "yandex_compute_instance" "web2" {
  name        = "web-server-2"
  zone        = var.zone_b
  folder_id   = "b1gqs3qvfova0eckiuqk"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8hrphlcsmi293sjc74"
      size     = 20
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.private.id
    security_group_ids = [yandex_vpc_security_group.web.id]
  }

  metadata = {
    ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDN95FDf+20e+xsqksNEs8glHREaGATRYtpN8qEvMaJtD24mST5l0CWYv6JiSTgwxfhRpFjlz+Udc+r5MMVxWYquDNTvNF76j7yb7OIpk86LgU8BL7QSTf7oURRpUxklDvvq5SmLPn08jJoxKSWZmn87hZ9Kdb5U4kSNY4TQGQizgB/o4i9/5lGvJaucOq+vMS6iLSUZUGKcIB7WyXDPznh2E15F+EsH/Qxc6wzJqfMAbSLylpAeXykBaFZcRWHcJVdHl5D6fkd+nL9PHS/9QrXZNVjb+ThXGjUggDmrVpKJYQy2fnyCOe62c+nLTWwl8G2usLrscWwZpYDrwAsOFGKs3nhFzVkXF37L4mPPr1jNSXDBJFo+nrSSFWYIxC/WPtY5m/Aw3zb8IqTNo3+oISvtoR4wPCcxpyNDIzIJiqW1VSfm0B3mmKd6feA44yM8vI9hQY/xU22y8qtHYgNwZ8YRD+/st3LIHpax+ds7xJg47KFefJIcVPx5ZbkZr414Ps0KtRLc9fdymV9wKtv1rbwCL/yr/cLHK46slakLiewdiWdx02iXZR+rmARKwqp4YzA6vlI3OkmsnY+eofTugkqDKsIpMn1c3RnmEVKQb4K7PsfALGBXUQQsrEKBDYL9Gw5SRi6jbxfYXdguldTCvmRKy4LRX4Q984pMDw7EmScRw== devops-kurs"

    user-data = <<-EOT
      #cloud-config
      ssh_authorized_keys:
        - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDN95FDf+20e+xsqksNEs8glHREaGATRYtpN8qEvMaJtD24mST5l0CWYv6JiSTgwxfhRpFjlz+Udc+r5MMVxWYquDNTvNF76j7yb7OIpk86LgU8BL7QSTf7oURRpUxklDvvq5SmLPn08jJoxKSWZmn87hZ9Kdb5U4kSNY4TQGQizgB/o4i9/5lGvJaucOq+vMS6iLSUZUGKcIB7WyXDPznh2E15F+EsH/Qxc6wzJqfMAbSLylpAeXykBaFZcRWHcJVdHl5D6fkd+nL9PHS/9QrXZNVjb+ThXGjUggDmrVpKJYQy2fnyCOe62c+nLTWwl8G2usLrscWwZpYDrwAsOFGKs3nhFzVkXF37L4mPPr1jNSXDBJFo+nrSSFWYIxC/WPtY5m/Aw3zb8IqTNo3+oISvtoR4wPCcxpyNDIzIJiqW1VSfm0B3mmKd6feA44yM8vI9hQY/xU22y8qtHYgNwZ8YRD+/st3LIHpax+ds7xJg47KFefJIcVPx5ZbkZr414Ps0KtRLc9fdymV9wKtv1rbwCL/yr/cLHK46slakLiewdiWdx02iXZR+rmARKwqp4YzA6vlI3OkmsnY+eofTugkqDKsIpMn1c3RnmEVKQb4K7PsfALGBXUQQsrEKBDYL9Gw5SRi6jbxfYXdguldTCvmRKy4LRX4Q984pMDw7EmScRw== devops-kurs
    EOT
  }
}