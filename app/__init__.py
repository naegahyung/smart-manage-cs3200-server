from flask import Flask
from routes import initialize_routes
from dotenv import load_dotenv
import json
import os

load_dotenv()
app = Flask(__name__, static_folder=None)

if __name__ == "__main__":
    initialize_routes(app)
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)

