# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"

1. Создадим БД в PostgreSQL "store":
  CREATE DATABASE store;
2. Создадим нового пользователя для миграций и автотестов, назначим ему права:
  CREATE ROLE migration_service_user WITH LOGIN PASSWORD 'super_secret';
  GRANT ALL PRIVILEGES ON DATABASE store TO migration_service_user;
3. Запрос для запроса продажи сосисок за каждый день предыдущей недели:
  SELECT o.date_created, SUM(op.quantity)
  FROM orders o
  JOIN order_product op ON o.id = op.order_id
  WHERE o.status = 'shipped' AND o.date_created > NOW() - INTERVAL '7 DAY'
  GROUP BY o.date_created;
