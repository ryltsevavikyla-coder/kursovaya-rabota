variable "folder_id" {
  description = "Folder ID"
  type        = string
}

variable "ssh_public_key" {
  description = "Публичный SSH ключ"
  type        = string
}

variable "zone_a" {
  default = "ru-central1-a"
}

variable "zone_b" {
  default = "ru-central1-b"
}