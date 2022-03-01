from flask import Flask, render_template
from models import User

app = Flask(__name__)

app.config['SECRET_KEY'] = "verysecretdonttell"

@app.route('/')
def homepage():
    return "this is home"