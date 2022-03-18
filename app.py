from flask import Flask, render_template, request, flash, redirect, session
from models import User, db, connect_db, User, Favorite, Resort, Search
from forms import LoginForm, RegisterForm, StateSearchForm


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
    form = StateSearchForm()
    return render_template('homepage.html', form=form)


@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegisterForm()

    if form.validate_on_submit():
        user = User.register(form)

        if user:
            name = form.username.data
            pwd = form.password.data

            user = User.register(form)
            db.session.add(user)
            db.session.commit()

            session["user_id"] = user.id
            session["user_name"] = user.name
            flash("You have successfully registered your account!", "alert-success")
            return redirect('/')

    return render_template('register.html', form=form)


@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()

    if form.validate_on_submit():
        user = User.authenticate(form)

        if user:
            session['user_id'] = user.id
            flash("Logged in Successfully!", "alert-success")
            return redirect('/')
        else: 
            flash("Bad Username/Password", "alert-danger")
    
    return render_template('login.html', form=form)


@ app.route('/logout')
def logout():
    session.pop('user_id')
    return redirect('/')


# TODO Routes:

@app.route("/search", methods=["POST"])
def search():
    form = StateSearchForm()

    # if form.validate_on_submit():
    resorts_in_search = Resort.query.filter(Resort.state == form.state.data).all()
    return render_template('search_state_results.html', resorts=resorts_in_search)


@app.route("/resort/<int:resort_id>", methods=["GET"])
def show_resort(resort_id):
    resort = Resort.query.get_or_404(resort_id)
    lat, lon = resort.lat, resort.lon

    # TODO: get forecast from api
    pass


# @app.route("/favorites/<int: user_id>", methods=["GET", "POST"])

# @app.route("/settings/<int: user_id>", methods=["GET", "POST"])