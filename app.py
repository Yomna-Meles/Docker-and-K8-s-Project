from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "<h1>Hello from Kubernetes!</h1><p>Running inside a Pod.</p>"

@app.route('/health')
def health():
    return {"status": "healthy"}, 200
