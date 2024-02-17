# Роль для установки ClickHouse

## Описание
Роль предназначена для установки и настройки ClickHouse - колоночной СУБД с открытым исходным кодом. 
Она устанавливает необходимые компоненты, создает базу данных, таблицу для логов, пользователя для записи в БД и конфигурирует сервер для работы внешних подключений.

## Компоненты
- clickhouse-client
- clickhouse-server
- clickhouse-common-static

## Требования
- ansible
- доступ к серверу для установки ClickHouse
- права администратора на сервере

## Переменные
### default/main.yml
clickhouse_user: user
clickhouse_password: password

### vars/main.yml
clickhouse_version: "22.10.4.23"
clickhouse_packages:
  - clickhouse-client
  - clickhouse-server
  - clickhouse-common-static
clickhouse_config_path: /etc/clickhouse-server/config.xml
clickhouse_users_path: /etc/clickhouse-server/users.xml


## Зависимости
Отсутствуют

## Пример использования
- hosts: clickhouse
  roles:
    - role: clickhouse-role


## Лицензия
MIT

## Информация об авторе
Автор: [ZergiShark]