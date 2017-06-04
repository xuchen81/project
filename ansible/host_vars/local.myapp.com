deploymenthost: "local"
user: "vagrant"
domain: "baseproject.com"

db_name: "{{app_name}}"
db_password: "appdMysqlTest"
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
