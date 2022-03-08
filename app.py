from flask import Flask, render_template, request, flash, redirect, session
from models import User, db, connect_db, User, Favorite, Resort, Search
from forms import LoginForm, RegisterForm


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
    return render_template('homepage.html')


@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegisterForm()

    if form.validate_on_submit():
        name = form.username.data
        pwd = form.password.data

        user = User.register(form)
        db.session.add(user)
        db.session.commit()

        session["user_id"] = user.id
        flash("You have successfully registered your account!")
        return redirect('/')

    return render_template('register.html', form=form)


@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()

    if form.validate_on_submit():
        user = User.authenticate(form)

        if user:
            session['id'] = user.id
            return redirect('/')
        else: 
            form.username.errors = ['Bad Username/Password']
    
    return render_template('login.html', form=form)