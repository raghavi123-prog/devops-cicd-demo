




from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify(message="Application is live", status="OK"), 200

@app.route("/health")
def health():
    """Health check endpoint used by Cloud Run startup and liveness probes."""
    return jsonify(status="healthy", uptime="ok"), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
