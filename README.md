# ansible-3
## Подготовка к выполнению

1. (Необязательно) Познакомтесь с [lighthouse](https://youtu.be/ymlrNlaHzIY?t=929)
2. Подготовьте в Yandex Cloud три хоста: для `clickhouse`, для `vector` и для `lighthouse`.

Ссылка на репозиторий LightHouse: [https://github.com/VKCOM/lighthouse](https://github.com/VKCOM/lighthouse)

## Основная часть

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает lighthouse.
```
  - name: lighthouse-role
    src: git@github.com:danilabar/lighthouse-role.git
    scm: git
    version: "0.1.0"
```
2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.
3. Tasks должны: скачать нужной версии дистрибутив, выполнить распаковку в выбранную директорию, сгенерировать конфигурацию с параметрами.
4. Приготовьте свой собственный inventory файл prod.yml.
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
2. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
3. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
4. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
5. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.
## Решение
* Виртуальные машины создаются через terraform, далее используется ansible на локальной машине
* Роли для `clickhouse`, `vector`, `lighthouse`  [здесь](./ansible/roles)
* [Inventory](./ansible/terraform/inventory.tf) формируется при инициализации инфраструктуры
* Добавлена установка `lighthouse` в [site.yml](./ansible/site.yml)
* Созданы [group_vars](./ansible/group_vars/light_house)
Необходимо добавить ключ `key.json` в директории `terraform`:
```
yc iam key create \
  --service-account-id <идентификатор_сервисного_аккаунта> \
  --folder-name <имя_каталога_с_сервисным_аккаунтом> \
  --output key.json
```
Далее используем `terraform apply`:
![screenshot](./screenshots/1.png)
![screenshot](./screenshots/2.png)
После исполнения `terraform` получается ссылка формата: `http://51.250.79.234/#http://178.154.207.179:8123/?user=user`
Пароль `password`
![screenshot](./screenshots/3.png)
* После работы используйте:
```
terraform destroy
```
# ansible-4

## Подготовка к выполнению

1. - Необязательно. Познакомьтесь с [LightHouse](https://youtu.be/ymlrNlaHzIY?t=929).
2. Создайте два пустых публичных репозитория в любом своём проекте: vector-role и lighthouse-role.
3. Добавьте публичную часть своего ключа к своему профилю на GitHub.

## Основная часть

Ваша цель — разбить ваш playbook на отдельные roles.

Задача — сделать roles для ClickHouse, Vector и LightHouse и написать playbook для использования этих ролей.

Ожидаемый результат — существуют три ваших репозитория: два с roles и один с playbook.

**Что нужно сделать**

1. Создайте в старой версии playbook файл `requirements.yml` и заполните его содержимым:
    
    ```yaml
    ---
      - src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
        scm: git
        version: "1.13"
        name: clickhouse 
    ```
    
2. При помощи `ansible-galaxy` скачайте себе эту роль.
    
3. Создайте новый каталог с ролью при помощи `ansible-galaxy role init vector-role`.
    
4. На основе tasks из старого playbook заполните новую role. Разнесите переменные между `vars` и `default`.
    
5. Перенести нужные шаблоны конфигов в `templates`.
    
6. Опишите в `README.md` обе роли и их параметры. Пример качественной документации ansible role [по ссылке](https://github.com/cloudalchemy/ansible-prometheus).
    
7. Повторите шаги 3–6 для LightHouse. Помните, что одна роль должна настраивать один продукт.
    
8. Выложите все roles в репозитории. Проставьте теги, используя семантическую нумерацию. Добавьте roles в `requirements.yml` в playbook.
    
9. Переработайте playbook на использование roles. Не забудьте про зависимости LightHouse и возможности совмещения `roles` с `tasks`.
    
10. Выложите playbook в репозиторий.
    
11. В ответе дайте ссылки на оба репозитория с roles и одну ссылку на репозиторий с playbook.

## Решение 

* Создан файл [requirements.yml](./requirements.yml)
* Созданы репозитории с ролями:
[LightHouse](https://github.com/ZergiShark/lighthouse-role)
[ClickHouse](https://github.com/ZergiShark/clickhouse-role)
[Vector](https://github.com/ZergiShark/vector-role)
* Установка ansible ролей с помощью ansible-galaxy:
```
azamat@debian:~/ansible-3/ansible$ ansible-galaxy install -r requirements.yml -p roles
Starting galaxy role install process
- extracting clickhouse-role to /home/azamat/ansible-3/ansible/roles/clickhouse-role
- clickhouse-role (0.1.0) was installed successfully
- extracting vector-role to /home/azamat/ansible-3/ansible/roles/vector-role
- vector-role (0.1.0) was installed successfully
- extracting lighthouse-role to /home/azamat/ansible-3/ansible/roles/lighthouse-role
- lighthouse-role (0.1.0) was installed successfully
```
* Установленные и настроенные ansible роли с описание можно посмотреть [здесь](./ansible/roles)
