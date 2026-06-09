FROM python:3.11-slim

WORKDIR /app

RUN pip install --no-cache-dir flask gunicorn

COPY cipher.py .
COPY output.json ./files/output.json

COPY <<'EOF' app.py
from flask import Flask, send_file, jsonify
import os

app = Flask(__name__)

@app.route('/')
def index():
    return jsonify({
        "challenge": "Pearl Cipher",
        "category": "Cryptography",
        "difficulty": "Easy",
        "points": 150,
        "download": "/download/output.json",
        "instructions": [
            "Download output.json",
            "Decode the Base64 string",
            "Apply ROT13 to the result",
            "Get the flag!"
        ]
    })

@app.route('/download/output.json')
def download():
    return send_file('files/output.json', as_attachment=True, download_name='output.json')

@app.route('/health')
def health():
    return jsonify({"status": "ok"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

ENV PORT=5000
EXPOSE $PORT

CMD gunicorn app:app --bind 0.0.0.0:$PORT --workers 1
