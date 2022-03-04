from flask import Flask, render_template
from models import User, connect_db

app = Flask(__name__)

app.config['SECRET_KEY'] = "verysecretdonttell"

# ORM Settings
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///bluebird_dev'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

# init db connection
connect_db(app)

@app.route('/')
def homepage():
    return "this is home"