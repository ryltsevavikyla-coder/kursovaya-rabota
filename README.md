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
![VPC и подсети](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-10%20142739.png)

**2. Bastion Host**  
![Bastion Host](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-10%20142926.png)

### Terraform outputs:
```bash
bastion_public_ip = "93.77.191.182"
```
# Команда для подключения к Bastion:
```
Bashssh ubuntu@93.77.191.182
```
# Сайт

## Блок 2: Веб-сервера и Application Load Balancer

### Что было сделано:
- Созданы две виртуальные машины (`web-server-1` и `web-server-2`) в приватной подсети в разных зонах доступности.
- На обе ВМ установлен веб-сервер **nginx**.
- Настроен **Application Load Balancer** с распределением трафика.
- Добавлен NAT Gateway для выхода ВМ в интернет.
- Размещён статический сайт.

### Результат:
Сайт успешно работает через балансировщик по адресу:  
**http://81.26.179.195**

### Скриншоты:

**1. Список виртуальных машин**
![Список ВМ](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-11%20144902.png)

**2. web-server-1 (Overview)**
![web-server-1](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-11%20144928.png)

**3. web-server-2 (Overview)**
![web-server-2](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-11%20144951.png)

**4. Application Load Balancer**
![Application Load Balancer](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-11%20145019.png)

**5. Сайт через балансировщик (Web Server 1)**
![Сайт Web Server 1](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-11%20150106.png)

**6. Сайт через балансировщик (Web Server 2)**
![Сайт Web Server 2](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-11%20150110.png)

