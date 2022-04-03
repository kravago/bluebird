from flask import Flask, render_template, request, flash, redirect, session
from models import User, db, connect_db, User, Favorite, Resort, Search, State
from forms import LoginForm, RegisterForm, StateSearchForm
from secret import API_KEY, SECRET_KEY
import requests


app = Flask(__name__)

app.config['SECRET_KEY'] = SECRET_KEY

# ORM Settings
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///bluebird_dev'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

# init db connection
connect_db(app)

@app.route('/', methods=["GET", "POST"])
def homepage():
    form = StateSearchForm()
    form.state.choices = [(s.name, s.abbr) for s in State.query.all()]

    if form.validate_on_submit():
        resorts_in_search = Resort.query.filter(Resort.state == form.state.data).all()
        return render_template('search_state_results.html', resorts=resorts_in_search, form=form)

    return render_template('homepage.html', form=form)


@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegisterForm()
    form.state.choices = [(s.name, s.abbr) for s in State.query.all()]

    if form.validate_on_submit():

        # check if email is unique
        existing_user = User.query.filter_by(email=form.email.data).all()

        # import pdb
        # pdb.set_trace()

        if existing_user:
            flash('Email is already taken', 'alert-danger')
            redirect('/register')
        else:
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


@app.route('/logout')
def logout():
    session.pop('user_id')
    return redirect('/')


# TODO Routes:

@app.route("/resort/<int:resort_id>", methods=["GET"])
def show_resort(resort_id):
    resort = Resort.query.get_or_404(resort_id)
    lat, lon = resort.lat, resort.lon

    # TODO: get forecast from api and pass json to return template
    r = requests.get('https://api.weatherbit.io/v2.0/forecast/daily',
                        params={'key': API_KEY, 'lat': lat, 'lon': lon, 'units': 'I', 'days': 7}
                    )

    return render_template('resort.html', r=r.json(), resort=resort)

@app.route("/favorite/add/<int:resort_id>", methods=["POST"])
def add_favorite(resort_id):
    '''adds resort to favorites list'''

    if not session['user_id']:
        flash('Unauthorized Access')
        redirect('/')
    
    # TODO: finish method to add favorite
    f = Favorite(user_id=session['user_id'], resort_id=resort_id)
    db.session.add(f)
    db.session.commit()
    flash('added to favorites!', 'alert-success')
    return redirect(f"/resort/{resort_id}")

# @app.route("/favorites/<int: user_id>", methods=["GET", "POST"])

# @app.route("/settings/<int: user_id>", methods=["GET", "POST"])