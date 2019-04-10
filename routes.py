from utils import get_sql_data, post_sql_data, get_sql_data_single_value
from queries import *
from flask import request
import json
import uuid
import datetime

def initialize_routes(app):
    @app.route('/')
    def hello_world():
        return 'Welcome'

    @app.route('/api/properties')
    def get_all_properties():
        return get_sql_data(SHOW_ALL_PROPERTIES)

    @app.route('/api/tasks')
    def get_all_tasks():
        return get_sql_data(SHOW_ALL_TASKS)

    @app.route('/api/news')
    def get_all_news():
        if request.args:
            limit = request.args.get('limit')
            return get_sql_data(show_news_with_limit(limit))
        return get_sql_data(SHOW_ALL_NEWS)
    
    @app.route('/api/property/<id>')
    def get_property_info(id):
        return get_sql_data(show_property_info(id))

    @app.route('/api/tasks/<id>')
    def get_tasks_from_property(id):
        return get_sql_data(show_tasks_under_property(id))

    @app.route('/api/task', methods= ['POST', 'DELETE', 'PATCH'])
    def create_task():
        body = json.loads(request.data)
        # body will only contain created_by, body, OPTIONAL (property_id)
        if request.method == 'POST':
            body['id'] = str(uuid.uuid4())
            time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            body['created'] = time
            body['updated'] = time
            body['done'] = 0
            if 'property_id' not in body:
                return post_sql_data(add_task, body)
            address = get_sql_data_single_value(get_property_address(body['property_id']))

            body['full_address'] = address
            return post_sql_data(add_task_with_property, body)
        if request.method == 'DELETE':
            return post_sql_data(delete_task, body)
        if request.method == 'PATCH':
            body['updated'] = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            return post_sql_data(update_task_body, body)
        return ''

    @app.route('/api/address/search', methods=['POST'])
    def search_address():
        body = json.loads(request.data)
        # body will contain query
        if request.method == 'POST':
            return get_sql_data(search_address_query(body))
        return
    
    @app.route('/api/property', methods = ['POST', 'DELETE'])
    def create_property():
        body = json.loads(request.data)
        if request.method == 'POST':
            address_id = str(uuid.uuid4())
            address_body = body['step0']
            address_body['id'] = address_id
            address = post_sql_data(add_address, address_body)

            owner_id = str(uuid.uuid4())
            owner_body = body['step3']
            owner_body['id'] = owner_id
            owner = post_sql_data(add_owner, owner_body)

            property_id = str(uuid.uuid4())
            property_body = body['step1']
            property_body['id'] = property_id
            property_body['location'] = address_id
            property_body['managedBy'] = "f9a88fd7-8341-4355-a460-bbc0e79cb104"
            property_body['ownedBy'] = owner_id
            property_body['rentDue'] = body['step2']['rentDue']
            property_body['status'] = 'OCCUPIED' if property_body['occupied'] == True else 'VACANT'
            property_info = post_sql_data(add_property, property_body)

            tenant_id = str(uuid.uuid4())
            tenant_body = body['step2']
            tenant_body['id'] = tenant_id
            tenant_body['location'] = property_id
            tenant = post_sql_data(add_tenant, tenant_body)

            return_body = body['step1']
            return_body['street1'] = body['step0']['street1']
            return_body['street 2'] = body['step0']['street2']
            return_body['city'] = body['step0']['city']
            return_body['state'] = body['step0']['state']
            return_body['zip'] = body['step0']['zip']
            return_body['rent_amount'] = body['step1']['rent']
            return_body['rooms'] = body['step1']['bedrooms']
            return_body['property_type'] = body['step1']['houseType']
            return json.dumps(return_body)
        if request.method == 'DELETE':
            return post_sql_data(delete_property, body)
        return ''