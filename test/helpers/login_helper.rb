module LoginHelper
  def login_user(user = User.create!(email: 'meu.email@iugu.com.br', password: '123456'))
    login_as user, scope: :user
  end
end