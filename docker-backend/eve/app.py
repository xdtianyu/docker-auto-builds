from eve import Eve


config = {
    'MONGO_HOST': 'localhost',
    'MONGO_PORT': 27017,
    'MONGO_DBNAME': 'contacts_db',
    'URL_PREFIX': 'api',
    'API_VERSION': 'v1',
    'DEBUG': True,
    'DOMAIN': {'contacts': {}}
}


app = Eve(settings=config)
app.run()
