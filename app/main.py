import os

from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/health")
def health():
    return jsonify({"status": "healthy"})


@app.route("/")
def root():
    return jsonify({"message": "Hello DevOps!"})


if __name__ == "__main__":
    host = os.getenv("HOST", "127.0.0.1")  # Only 0.0.0.0 in container
    app.run(host=host, port=5000)
