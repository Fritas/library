"""
    Instancia o bd para o sistema flask
"""

from datetime import datetime
from . import db

class Book(db.Model):
    __tablename__ = 'book'
    cod_book = db.Column(db.Integer, primary_key=True, autoincrement=True)
    isbn_10 = db.Column(db.String(10), unique=True)
    isbn_13 = db.Column(db.String(13), unique=True)
    title_original = db.Column(db.String(50))
    title_portuguese = db.Column(db.String(50))
    synopsis = db.Column(db.String(200))

class Publisher(db.Model):
    __tablename__ = 'publisher'
    cod_publisher = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name_publisher = db.Column(db.String(20))
    website = db.Column(db.String(30))

class Person(db.Model):
    __tablename__ = 'person'
    cod_person = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name_person = db.Column(db.String(30))
    date_of_day = db.Column(db.DateTime, default=datetime.utcnow)
    author = db.RelationshipProperty('Author', backref='person', lazy=True)
    user = db.RelationshipProperty('User', backref='user', lazy=True)

class Category(db.Model):
    __tablename__ = 'category'
    cod_category = db.Column(db.Integer, primary_key=True, autoincrement=True)
    description_category = db.Column(db.String(20))

class Author(db.Model):
    __tablename__ = 'author'
    cod_author = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name_author = db.Column(db.String(20))
    cod_person = db.Column(
        db.Integer,
        db.ForeignKey('person.cod_person'),
        nullable=False
    )

class User(db.Model):
    __tablename__ = 'user'
    cod_user = db.Column(db.Integer, primary_key=True, autoincrement=True)
    cod_person = db.Column(
        db.Integer,
        db.ForeignKey('person.cod_person'),
        nullable=False
    )
    username_user = db.Column(db.String(15), nullable=False)
    password_user = db.Column(db.String(15), nullable=False)

class Publications(db.Model):
    __tablename__ = 'publications'
    cod_book = db.Column(db.Integer, primary_key=True)
    cod_publisher = db.Column(db.Integer, primary_key=True)

class Authorship(db.Model):
    __tablename__ = 'authorship'
    cod_book = db.Column(db.Integer, primary_key=True)
    cod_author = db.Column(db.Integer, primary_key=True)

class AssociatedCategory(db.Model):
    __tablename__ = 'associatedcategory'
    cod_book = db.Column(db.Integer, primary_key=True)
    cod_category = db.Column(db.Integer, primary_key=True)

class MyBooks(db.Model):
    __tablename__ = 'mybooks'
    cod_book = db.Column(db.Integer, primary_key=True)
    cod_user = db.Column(db.Integer, primary_key=True)