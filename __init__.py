import os
from flask import Flask
from routes import initialize_routes
import json

def create_app(config_name):
    TEMPLATE_PATH = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "client/build/index.html")
    STATIC_PATH = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "client/build/static")
    app = Flask(__name__, static_folder=STATIC_PATH)

    initialize_routes(app)
    
    return app

