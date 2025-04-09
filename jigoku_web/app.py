from flask import Flask, render_template, redirect, url_for, session, request
from flask_oauthlib.client import OAuth
from werkzeug.security import generate_password_hash, check_password_hash
import os
import secrets

app = Flask(__name__)
app.secret_key = secrets.token_hex(16)

# Configuración de OAuth para Google
oauth = OAuth(app)
google = oauth.remote_app(
    'google',
    consumer_key='TU_CLIENT_ID_GOOGLE',
    consumer_secret='TU_CLIENT_SECRET_GOOGLE',
    request_token_params={
        'scope': 'email profile'
    },
    base_url='https://www.googleapis.com/oauth2/v1/',
    request_token_url=None,
    access_token_method='POST',
    access_token_url='https://accounts.google.com/o/oauth2/token',
    authorize_url='https://accounts.google.com/o/oauth2/auth',
)

# Base de datos simulada de usuarios
users_db = {
    'admin@example.com': {
        'password': generate_password_hash('admin123'),
        'name': 'Admin'
    }
}

@app.route('/')
def index():
    user_data = session.get('user')
    return render_template('index.html', user=user_data)

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        
        user = users_db.get(email)
        if user and check_password_hash(user['password'], password):
            session['user'] = {
                'email': email,
                'name': user['name'],
                'provider': 'email'
            }
            return redirect(url_for('index'))
        
        return render_template('index.html', error="Credenciales inválidas")
    
    return redirect(url_for('index'))

@app.route('/login/google')
def login_google():
    return google.authorize(callback=url_for('authorized', _external=True))

@app.route('/login/google/authorized')
def authorized():
    response = google.authorized_response()
    if response is None or response.get('access_token') is None:
        return 'Acceso denegado: Razón={} Error={}'.format(
            request.args['error_reason'],
            request.args['error_description']
        )
    
    session['google_token'] = (response['access_token'], '')
    user_info = google.get('userinfo')
    
    session['user'] = {
        'email': user_info.data['email'],
        'name': user_info.data.get('name', user_info.data['email']),
        'picture': user_info.data.get('picture'),
        'provider': 'google'
    }
    
    return redirect(url_for('index'))

@google.tokengetter
def get_google_oauth_token():
    return session.get('google_token')

@app.route('/logout')
def logout():
    session.pop('google_token', None)
    session.pop('user', None)
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)
    