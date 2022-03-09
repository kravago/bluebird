from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
import datetime


db = SQLAlchemy()

bcrypt = Bcrypt()

def connect_db(app):
    db.app = app
    db.init_app(app)


class User(db.Model):
    __tablename__ = "user"

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)

    username = db.Column(db.Text, nullable=False)

    name = db.Column(db.Text, nullable=False)
    
    email = db.Column(db.Text, unique=True)
    
    state = db.Column(db.Text, nullable=False)
    
    password = db.Column(db.Text, nullable=False)

    created_at = db.Column(db.DateTime, 
                            default=datetime.datetime.now,
                            nullable=False)

    updated_at = db.Column(db.DateTime, 
                            default=datetime.datetime.now, 
                            onupdate=datetime.datetime.now, 
                            nullable=False)

    
    # relationships
    favorites = db.relationship('Favorite', backref='users')
    resorts = db.relationship('Resort', backref='users', secondary='favorite')

    searches = db.relationship('Search', backref='users')
    searched_resorts = db.relationship('Resort', backref='user', secondary='search')
    

    # start_register
    @classmethod
    def register(cls, form):
        """Register user w/hashed password & return user."""

        hashed = bcrypt.generate_password_hash(form.password.data)
        # turn bytestring into normal (unicode utf8) string
        hashed_utf8 = hashed.decode("utf8")

        # return instance of user w/username and hashed pwd
        return cls(name=form.name.data,
                    email=form.email.data,
                    username=form.username.data, 
                    state=form.state.data,
                    password=hashed_utf8)
    # end_register

    # start_authenticate
    @classmethod
    def authenticate(cls, form):
        """Validate that user exists & password is correct.

        Return user if valid; else return False.
        """

        u = User.query.filter_by(username=form.username.data).first()

        if u and bcrypt.check_password_hash(u.password, form.password.data):
            # return user instance
            return u
        else:
            return False
    # end_authenticate   

class Resort(db.Model):
    __tablename__ = "resort"
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    
    name = db.Column(db.Text, nullable=False)
    
    lat = db.Column(db.Float, nullable=False)
    
    lon = db.Column(db.Float, nullable=False)
    
    created_at = db.Column(db.DateTime, 
                            default=datetime.datetime.now,
                            nullable=False)

    updated_at = db.Column(db.DateTime, 
                            default=datetime.datetime.now, 
                            onupdate=datetime.datetime.now,
                            nullable=False)


class Favorite(db.Model):
    __tablename__ = "favorite"
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    
    resort_id = db.Column(db.Integer, db.ForeignKey('resort.id'))
    
    timestamp = db.Column(db.DateTime, default=datetime.datetime.now, nullable=False)



class Search(db.Model):
    __tablename__ = "search"
    
    id = db.Column(db.Integer, primary_key=True)
    
    timestamp = db.Column(db.DateTime, default=datetime.datetime.now, nullable=False)
    
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    
    resort_id = db.Column(db.Integer, db.ForeignKey('resort.id'))