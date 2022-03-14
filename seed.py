from models import db
from app import app
import datetime


# if exists drop and create
db.drop_all()
db.create_all()
