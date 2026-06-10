from flask import Flask, request, render_template_string

app = Flask(__name__)


@app.route("/")
def index():
    return """<h1>Flask SSTI Demo</h1>
<p>Try: <code>/greet?name={{7*7}}</code></p>
"""


@app.route("/greet")
def greet():
    name = request.args.get("name", "")
    # DANGER: user input directly concatenated into template string
    template = f"<h1>Hello {name}</h1>"
    return render_template_string(template)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
