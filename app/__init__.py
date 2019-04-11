from flask import Flask
from routes import initialize_routes
from dotenv import load_dotenv
import json

load_dotenv()
app = Flask(__name__, static_folder=None)
initialize_routes(app)


