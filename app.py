from flask import Flask, render_template, request, flash, redirect, session
from models import User, db, connect_db, User, Favorite, Resort, Search, State
from forms import LoginForm, RegisterForm, StateSearchForm, UpdateUserForm
from flask_bcrypt import Bcrypt
from secret import API_KEY, SECRET_KEY
import requests, os, re


app = Flask(__name__)

app.config['SECRET_KEY'] = os.environ.get('SECRET_KEY', 'yeaaahbaby')

# ORM Settings
uri = os.environ.get('DATABASE_URL', 'postgresql:///bluebird_dev')
if uri.startswith("postgres://"):
    uri = uri.replace("postgres://", "postgresql://", 1)
    
app.config['SQLALCHEMY_DATABASE_URI'] = uri

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

# bcrypt
bcrypt = Bcrypt()

# init db connection
connect_db(app)

@app.route('/', methods=["GET", "POST"])
def homepage():
    form = StateSearchForm()
    form.state.choices = [(s.name, s.name) for s in State.query.all()]

    # if logged in, show last 3 searches
    searches = None
    if session.get('user_id'):
        searches = Search.query.filter_by(user_id=session['user_id']).order_by(Search.timestamp.desc())[:3]

    if form.validate_on_submit():
        resorts_in_search = Resort.query.filter(Resort.state == form.state.data).all()
        
        return render_template('search_state_results.html', resorts=resorts_in_search, form=form, searches=searches)

    return render_template('homepage.html', form=form, searches=searches)

@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegisterForm()
    form.state.choices = [(s.name, s.name) for s in State.query.all()]

    if form.validate_on_submit():

        # check if email is unique
        existing_user = User.query.filter_by(email=form.email.data).all()

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

def find_bluebirds(forecast):
    '''function to add a key to resort '''

    for day in forecast['data']:
        sunny_condition = (day['weather']['code'] == 800) or (day['weather']['code'] == 801)

        if (day['snow'] > 0) and sunny_condition:
            day['category'] = 'primary'
            day['suggestion'] = 'bluebird day!'
        elif sunny_condition:
            day['category'] = 'success'
            day['suggestion'] = 'sunny day to ski!'
        else:
            day['category'] = 'secondary'
    
    return forecast

@app.route("/resort/<int:resort_id>", methods=["GET"])
def show_resort(resort_id):
    resort = Resort.query.get_or_404(resort_id)
    lat, lon = resort.lat, resort.lon

    # get forecast from api and pass json to return template
    r = requests.get('https://api.weatherbit.io/v2.0/forecast/daily',
                        params={'key': API_KEY, 'lat': lat, 'lon': lon, 'units': 'I', 'days': 7}
                    )
    fc = r.json()
    formatted_fc = find_bluebirds(fc)

    # store the user search history
    if session['user_id']:
        record = Search(user_id=session['user_id'], resort_id=resort_id)
        db.session.add(record)
        db.session.commit()

    return render_template('resort.html', forecast=formatted_fc, resort=resort)

@app.route("/favorite/add/<int:resort_id>", methods=["POST"])
def add_favorite(resort_id):
    '''adds resort to favorites list'''

    if not session['user_id']:
        flash('Unauthorized Access')
        redirect('/')
    
    f = Favorite(user_id=session['user_id'], resort_id=resort_id)
    db.session.add(f)
    db.session.commit()
    flash('added to favorites!', 'alert-success')
    return redirect(f"/resort/{resort_id}")

@app.route("/favorites/<int:user_id>", methods=["GET"])
def show_favorites(user_id):
    '''show the favorites of a user'''
    favs = Favorite.query.filter_by(user_id=user_id).all()
    return render_template('favorites.html', favs=favs)

@app.route("/favorites/remove/<int:resort_id>", methods=['POST'])
def remove_fav(resort_id):
    '''remove favorite'''

    if not session['user_id']:
        flash('Unauthorized Access')
        redirect('/')
    
    f = Favorite.query.filter_by(user_id=session['user_id'], resort_id=resort_id).first()
    deleted_resort = f.resort.name
    db.session.delete(f)
    db.session.commit()
    flash(f'{deleted_resort} has been removed', 'alert-success')
    return redirect(f'/favorites/{session["user_id"]}')

@app.route("/settings/<int:user_id>", methods=["GET", "POST"])
def show_settings(user_id):
    '''controls updating user info'''

    u = User.query.get_or_404(user_id)
    form = UpdateUserForm(obj=u)
    form.state.choices = [(s.name, s.name) for s in State.query.all()]
    
    if request.method == 'POST' and form.validate_on_submit():
        u.username = form.username.data
        u.name = form.name.data
        u.email = form.email.data
        u.state = form.state.data
        u.password = bcrypt.generate_password_hash(form.password.data)

        db.session.commit()
        flash('user profile updated', 'alert-success')
        return redirect(f'/settings/{user_id}')
    

    return render_template('settings.html', form=form)