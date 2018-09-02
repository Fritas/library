"""
    Controller da aplicacao de autenticacao
"""

from flask import render_template, redirect, url_for, flash
from flask_login import login_user, login_required, logout_user
from . import auth
from .forms import LoginForm
from ..dao_static import Dao

@auth.route('/')
def index():
    return 'Index da aplicacao de autenticacao<br>/auth/login<br>/auth/logout'

@auth.route('/login', methods=['GET','POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        user = Dao.pegar_usuario()
        if user.username_user is not None:
            login_user(user)
            return redirect(url_for('main.index'))
        flash('Usuario ou senha invalidos')
    return render_template('auth/login.html', form=form)

@auth.route('/logout')
@login_required
def logout():
    logout_user()
    flash('Voce desconectou-se do servidor')
    return redirect(url_for('main.index'))