from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route('/')
def index():
    return jsonify({"message": "Hello, DevSecOps!", "version": "1.0.0"})

@app.route('/health')
def health():
    return jsonify({"status": "ok"})

@app.route('/users')
def users():
    # Simulated user list (no real data)
    return jsonify({"users": ["alice", "bob", "carol"]})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
