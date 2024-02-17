# Роль для установки Lighthouse

## Описание
Роль предназначена для установки и настройки Lighthouse - инструмента для автоматизированного аудита производительности веб-приложений. Роль производит установку Git, скачивание Lighthouse из репозитория, а также конфигурацию Lighthouse. Требуется отдельная установка и настройка Nginx.

## Требования
- ansible
- Установленный Git
- Отдельная установка и настройка Nginx
- Должна быть установлена и сконфигурирована [роль ClickHouse](https://github.com/ZergiShark/clickhouse-role)

## Переменные
### default/main.yml
lighthouse_user: netology
lighthouse_password: netology

### vars/main.yml
lighthouse_vcs: https://github.com/VKCOM/lighthouse.git
lighthouse_dir: /var/lib/lighthouse
lighthouse_access_log_name: lighthouse_access


## Зависимости
Требуется роль [clickhouse-role](https://github.com/ZergiShark/clickhouse-role) для установки и настройки ClickHouse.

## Пример использования
- hosts: lighthouse
  roles:
    - role: lighthouse-role


## Лицензия
MIT

## Информация об авторе
Автор: [ZergiShark]