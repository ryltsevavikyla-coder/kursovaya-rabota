terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.13"
    }
  }
}

provider "yandex" {
  token = var.yc_token          # токен берём из переменной
  zone  = "ru-central1-a"
}