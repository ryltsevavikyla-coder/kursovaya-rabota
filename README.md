# Курсовой проект на профессии «DevOps-инженер с нуля»
## Блок 1: Сеть, Security Groups и Bastion Host

### Что сделано:
- Создана VPC `devops-kurs-network`
- Создано 2 подсети в разных зонах доступности (`ru-central1-a` и `ru-central1-b`)
- Настроены 3 группы безопасности (bastion-sg, web-sg, monitoring-sg)
- Развёрнут Bastion Host с публичным IP
- Настроен доступ по SSH только через Bastion

### Скриншоты:

**1. Облачная сеть и подсети**  
![VPC и подсети]()

**2. Bastion Host**  
![Bastion Host]()

### Terraform outputs:
```bash
bastion_public_ip = "93.77.191.182"
```
# Команда для подключения к Bastion:
```
Bashssh ubuntu@93.77.191.182
```
