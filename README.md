# Курсовой проект на профессии «DevOps-инженер с нуля»

# Сайт

## Блок 1 : Веб-сервера и Application Load Balancer

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


## Блок 2: Мониторинг

### Что было сделано:

- Создана отдельная виртуальная машина `monitoring` в публичной подсети
- Установлен и настроен **Prometheus**
- На web-серверах (`web-server-1` и `web-server-2`) установлен **Node Exporter**
- На web-серверах установлен **Nginx Prometheus Exporter**
- Установлена **Grafana**, настроено подключение к Prometheus как источнику данных
- Создан дашборд с основными метриками

### Метрики в дашборде:

- **CPU Utilization** + thresholds
- **RAM Utilization** + thresholds
- **Disk Usage** (в GB) + thresholds
- **Network Usage** + thresholds
- **Saturation (Load Average)** + thresholds
- **http_response_count_total** и **http_response_size_bytes** (панели созданы, но метрики пока не отображаются из-за низкого трафика на сайте)

### Скриншоты:
* Зашла в Grafana 

![1](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-12%20143158.png)
* Список вм
![2](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-12%20172214.png)
* Рызвернутый monitoring 
![3](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-12%20172231.png)
* Подключен Prometheus 
![4](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-12%20172437.png)
* Дашборды
![2](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-12%20171914.png)


### Примечания:
- Все сервисы запущены и работают.
- Nginx Exporter установлен и добавлен в Prometheus.
- Метрики HTTP пока не собираются из-за отсутствия нагрузки на сайт.


## Блок 3: Сбор, хранение и анализ логов

При выполнении этого блока у меня возникли серьёзные проблемы. Я очень много раз пыталась настроить Filebeat на виртуальных машинах web-server-1 и web-server-2 в Yandex Cloud. Пересоздавала ВМ, меняла Terraform, добавляла SSH-ключи через metadata, user-data и вручную через Serial Console — ничего не помогало. Постоянно появлялась ошибка `Permission denied (publickey)`.

После нескольких дней попыток я решила развернуть стек ELK локально с помощью Docker, чтобы выполнить требования блока.

### Что было сделано:
- Запущен Elasticsearch 8.14.0 и Kibana 8.14.0 через Docker
- Созданы тестовые логи nginx
- Логи успешно отправлены в Elasticsearch
- Создан Data View в Kibana
- Логи отображаются в разделе Discover

### Скриншоты:
![1](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-14%20132435.png)
![2](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-14%20133545.png)
![3](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-14%20133603.png)




---

Готово. Можешь копировать как есть.  

Хочешь, я сделаю этот текст ещё короче?

# Блок 4: Сеть, Security Groups и Bastion Host

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

## Блок 5: Резервное копирование

Для резервного копирования всех виртуальных машин было создано расписание снимков дисков.

### Настроенное расписание:
- **Имя**: `daily-snapshot-7days`
- **Расписание**: Ежедневно в 04:00
- **Срок хранения**: 7 дней
- **Применено к дискам**: bastion-host, web-server-1, web-server-2, monitoring, elasticsearch

### Скриншоты:
![1](https://github.com/ryltsevavikyla-coder/kursovaya-rabota/blob/main/Screenshot%202026-06-13%20171003.png)


Расписание работает автоматически. Снимки создаются каждый день и хранятся 7 дней.
