# Роль для установки Vector

## Описание
Роль предназначена для установки и настройки Vector - гибкого сборщика и маршрутизатора логов. Роль производит установку Vector, создание systemd unit для Vector и конфигурацию Vector для передачи данных в ClickHouse.

## Требования
- ansible
- Должна быть установлена и сконфигурирована [роль ClickHouse](https://github.com/ZergiShark/clickhouse-role)
- Наличие хоста clickhouse-01 в inventory

## Переменные
### default/main.yml
clickhouse_user: netology
clickhouse_password: netology

### vars/main.yml
endpoint: http://{{ hostvars['clickhouse-01'].ansible_host }}:8123


## Зависимости
Требуется роль [clickhouse-role](https://github.com/ZergiShark/clickhouse-role) для установки и настройки ClickHouse.

## Пример использования
- hosts: vector
  roles:
    - role: vector-role


## Лицензия
MIT

## Информация об авторе
Автор: ZergiShark