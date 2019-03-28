from utils import get_sql_data, post_sql_data
from queries import *
from flask import request
import json
import uuid
import datetime

def initialize_routes(app, db):
    @app.route('/')
    def hello_world():
        return 'Welcome'

    @app.route('/api/properties')
    def get_all_properties():
        return get_sql_data(db, SHOW_ALL_PROPERTIES)

    @app.route('/api/tasks')
    def get_all_tasks():
        return get_sql_data(db, SHOW_ALL_TASKS)

    @app.route('/api/news')
    def get_all_news():
        if request.args:
            limit = request.args.get('limit')
            return get_sql_data(db, show_news_with_limit(limit))
        return get_sql_data(db, SHOW_ALL_NEWS)
    
    @app.route('/api/property/<id>')
    def get_property_info(id):
        return get_sql_data(db, show_property_info(id))

    @app.route('/api/tasks/<id>')
    def get_tasks_from_property(id):
        return get_sql_data(db, show_tasks_under_property(id))

    @app.route('/api/task', methods= ['POST', 'DELETE'])
    def create_task():
        body = json.loads(request.data)
        # body will only contain created_by, body, OPTIONAL (property_id)
        if request.method == 'POST':
            body['id'] = str(uuid.uuid4())
            time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            body['created'] = time
            body['updated'] = time
            body['done'] = 0
            print(body)
            if 'property_id' not in body:
                return post_sql_data(db, add_task, body)
            return post_sql_data(db, add_task_with_property, body)
        if request.method = 'DELETE':
            to_be_deleted = body['id']
            # implement delete for task
        return ''
