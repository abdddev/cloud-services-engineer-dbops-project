# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"

1. Создадим БД в PostgreSQL "store":
  CREATE DATABASE store;
2. Создадим нового пользователя для миграций и автотестов, назнчим ему права:
  CREATE ROLE migration_service_user WITH LOGIN PASSWORD 'super_secret';
  GRANT ALL PRIVILEGES ON DATABASE store TO migration_service_user;
