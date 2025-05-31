from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json()
    # Dummy inference logic
    result = {'prediction': 'positive' if len(data.get('input', '')) % 2 == 0 else 'negative'}
    return jsonify(result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)