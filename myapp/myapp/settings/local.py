from myapp.settings.common import *

DEBUG = True

STATIC_ROOT = "/srv/myproject/public/static/"
MEDIA_ROOT = "/srv/myproject/public/media/"

REDIS_LOCATION = "redis://localhost:6379/0"

CELERY_RESULT_BACKEND = BROKER_URL = REDIS_LOCATION

CACHES = {
    "default": {
        "BACKEND": "django_redis.cache.RedisCache",
        "LOCATION": REDIS_LOCATION,
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
        }
    }
}
