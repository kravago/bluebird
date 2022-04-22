from unicodedata import name
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, EmailField, SelectField, PasswordField
from wtforms.validators import InputRequired, Email, Length, EqualTo


class RegisterForm(FlaskForm):
    name = StringField("Name", validators=[InputRequired()])
    email = EmailField("Email", validators=[InputRequired(), Email()])
    username = StringField("Username", validators=[InputRequired()])
    state = SelectField("State", validators=[InputRequired()])
    password = PasswordField("Password", validators=[InputRequired()])


class LoginForm(FlaskForm):
    username = StringField("Username", validators=[InputRequired()])
    password = PasswordField("Password", validators=[InputRequired()])


class StateSearchForm(FlaskForm):
    state = SelectField("Where do you ski?", validators=[InputRequired()])


class UpdateUserForm(FlaskForm):
    username = StringField("username", validators=[InputRequired()])
    name = StringField("name", validators=[InputRequired()])
    email = StringField("email", validators=[InputRequired(), Email()])
    state = SelectField("state", validators=[InputRequired()])
    password = PasswordField("password", validators=[InputRequired(), EqualTo('confirm', 'passwords must match')])
    confirm = PasswordField("repeat password", validators=[InputRequired()])