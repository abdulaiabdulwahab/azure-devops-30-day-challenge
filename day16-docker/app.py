import importlib
import socket

flask = importlib.import_module("flask")
app = flask.Flask(__name__)

@app.route("/")
def home():
    return flask.jsonify({
        "message": "Hello from Azure DevOps CI!",
        "hostname": socket.gethostname(),
        "status": "running"
    })

@app.route("/health")
def health():
    return flask.jsonify({
        "status": "healthy"
    })

if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=8080
    )