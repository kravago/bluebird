from models import db, User, Resort, Favorite, Search
from app import app
import datetime


# if exists drop and create
db.drop_all()
db.create_all()
