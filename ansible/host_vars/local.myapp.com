deploymenthost: "local"
user: "vagrant"
server_name: "local.{{domain}}"

db_name: "{{app_name}}"
db_password: "password"
db_hostname: "localhost"
db_port: "3306"

# S3
s3_bucket: ""

env:
  DEPLOYMENTHOST: "{{deploymenthost}}"
  RDS_DB_NAME: "{{db_name}}"
  RDS_USERNAME: "{{user}}"
  RDS_PASSWORD: "{{db_password}}"
  RDS_HOSTNAME: "{{db_hostname}}"
  RDS_PORT: "{{db_port}}"
  AWS_ACCESS_KEY_ID: "{{aws_access_key_id}}"
  AWS_SECRET_ACCESS_KEY: "{{aws_secret_access_key}}"
  CELERY_HOST: "{{ansible_hostname}}"

redis_version: "3.2.9"
redis_port: "6379"

celery_processes: 1
