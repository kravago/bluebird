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

    created_at = db.Column(db.Datetime, 
                            default=datetime.datetime.now, 
                            onupdate=datetime.datetime.now, 
                            nullable=False)

    updated_at = db.Column(db.Datetime, 
                            default=datetime.datetime.now, 
                            onupdate=datetime.datetime.now, 
                            nullable=False)


class Resorts(db.Model):
    __tablename__ = "resorts"
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    
    name = db.Column(db.Text, nullable=False)
    
    lat = db.Column(db.Float, nullable=False)
    
    lon = db.Column(db.Float, nullable=False)
    
    created_at = db.Column(db.Datetime, 
                            default=datetime.datetime.now, 
                            onupdate=datetime.datetime.now, 
                            nullable=False)

    updated_at = db.Column(db.Datetime, 
                            default=datetime.datetime.now, 
                            onupdate=datetime.datetime.now, 
                            nullable=False)


class Favorites(db.Model):
    __tablename__ = "favorites"
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    
    resort_id = db.Column(db.Integer, db.ForeignKey('resorts.id'))
    
    timestamp = db.Column(db.DateTime, default=datetime.datetime.now, nullable=False)

    

class History(db.Model):
    __tablename__ = "history"
    
    id = db.Column(db.Integer, primary_key=True)
    
    timestamp = db.Column(db.DateTime, default=datetime.datetime.now, nullable=False)
    
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    
    resort_id = db.Column(db.Integer, db.ForeignKey('resorts.id'))