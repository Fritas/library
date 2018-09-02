from .models import User

class Dao:

    @staticmethod
    def login():
        print('Conectado ao servidor!')

    @staticmethod
    def pegar_usuario():
        user = User()
        user.cod_user = 1
        user.cod_person = 1
        user.username_user = 'joao'
        user.password_user = '123'
        user.email = 'joao@joao.com'
        return user
