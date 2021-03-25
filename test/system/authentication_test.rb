require 'application_system_test_case'

class Authentication < ApplicationSystemTestCase
  test 'user sign up' do
    visit root_path
    click_on 'Cadastrar'
    fill_in 'Email', with: 'meu.email@iugu.com.br'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirmação de senha', with: 'password'
    within 'form' do
      click_on 'Cadastrar'
    end
    
    assert_text 'Boas vindas! Cadastrou e entrou com sucesso'
    assert_text 'meu.email@iugu.com.br'
    assert_link 'Sair'
    assert_no_link 'Cadastrar'
    assert_current_path root_path
  end

  test 'no blank fields in sign in' do
    visit root_path
    click_on 'Cadastrar'
    within 'form' do
      click_on 'Cadastrar'
    end
    
    assert_text 'Senha não pode ficar em branco'
    assert_text 'Email não pode ficar em branco'
  end

  test 'user sign in' do
    user = User.create!(email: 'meu.email@iugu.com.br', password: 'password')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Log in'

    assert_text 'Login efetuado com sucesso!'
    assert_text user.email
    assert_current_path root_path
    assert_link 'Sair'
    assert_no_link 'Entrar'
  end
end

# TODO: TESTE DE SAIR
# TODO: TESTE DE FALHA AO REGISTRAR
# TODO: TESTE DE FALHA AO LOGAR
# TODO: TESTE de recuperar senha
# TODO: I18n do user