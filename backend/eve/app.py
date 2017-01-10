from eve import Eve
from flask import current_app as app


public = {
    'allow_unknown': True,
    'resource_methods': ['GET', 'POST']
}

config = {
    'MONGO_HOST': 'localhost',
    'MONGO_PORT': 27017,
    'MONGO_DBNAME': 'test',
    'URL_PREFIX': 'api',
    'API_VERSION': 'v1',
    'DEBUG': False,
    'DOMAIN': {"contacts": public}
}


app = Eve(settings=config)
app.run()
