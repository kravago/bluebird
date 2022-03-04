from flask_sqlalchemy import SQLAlchemy
import datetime

db = SQLAlchemy()


def connect_db(app):
    db.app = app
    db.init_app(app)


class User(db.Model):
    __tablename__ = "user"

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)

    name = db.Column(db.Text, nullable=False)
    
    email = db.Column(db.Text, unique=True)
    
    state = db.Column(db.Text, nullable=False)
    
    password = db.Column(db.Text, nullable=False)

    created_at = db.Column(db.DateTime, 
                            default=datetime.datetime.now, 
                            onupdate=datetime.datetime.now, 
                            nullable=False)

    updated_at = db.Column(db.DateTime, 
                            default=datetime.datetime.now, 
                            onupdate=datetime.datetime.now, 
                            nullable=False)

    
    # relationships
    favorites = db.relationship('Favorite', backref='users')
    resorts = db.relationship('Resort', backref='users', secondary='favorites')

    searches = db.relationship('Search', backref='users')
    searched_resorts = db.relationship('Resort', backref='users', secondary='searches')
    


class Resort(db.Model):
    __tablename__ = "resort"
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    
    name = db.Column(db.Text, nullable=False)
    
    lat = db.Column(db.Float, nullable=False)
    
    lon = db.Column(db.Float, nullable=False)
    
    created_at = db.Column(db.DateTime, 
                            default=datetime.datetime.now, 
                            onupdate=datetime.datetime.now, 
                            nullable=False)

    updated_at = db.Column(db.DateTime, 
                            default=datetime.datetime.now, 
                            onupdate=datetime.datetime.now, 
                            nullable=False)


class Favorite(db.Model):
    __tablename__ = "favorites"
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    
    resort_id = db.Column(db.Integer, db.ForeignKey('resort.id'))
    
    timestamp = db.Column(db.DateTime, default=datetime.datetime.now, nullable=False)



class Search(db.Model):
    __tablename__ = "searches"
    
    id = db.Column(db.Integer, primary_key=True)
    
    timestamp = db.Column(db.DateTime, default=datetime.datetime.now, nullable=False)
    
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    
    resort_id = db.Column(db.Integer, db.ForeignKey('resort.id'))