import os
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({
        "message": "Welcome to the DevOps CI/CD Demo API",
        "status": "online"
    }), 200

@app.route('/health')
def health_check():
    return jsonify({
        "status": "healthy",
        "uptime": "ok"
    }), 200

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    app.run(host='0.0.0.0', port=port)
