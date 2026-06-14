output "bastion_public_ip" {
  value       = yandex_compute_instance.bastion.network_interface[0].nat_ip_address
  description = "Публичный IP Bastion Host"
}

output "alb_public_ip" {
  value       = yandex_alb_load_balancer.web.listener[0].endpoint[0].address[0].external_ipv4_address[0].address
  description = "Публичный IP Application Load Balancer"
}

output "web1_internal_ip" {
  value = yandex_compute_instance.web1.network_interface[0].ip_address
}

output "web2_internal_ip" {
  value = yandex_compute_instance.web2.network_interface[0].ip_address
}

output "monitoring_internal_ip" {
  value = yandex_compute_instance.monitoring.network_interface[0].ip_address
}