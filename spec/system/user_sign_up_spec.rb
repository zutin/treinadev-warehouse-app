require 'rails_helper'

describe 'User signs up' do
  it 'can sign up successfully' do
    #Arrange

    #Act
    visit root_path
    click_on 'Sign in'
    click_on 'Sign up'
    fill_in 'Username', with: 'Maria'
    fill_in 'E-mail', with: 'maria@email.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    within('form') do
      click_on 'Sign up'
    end

    #Assert
    expect(page).to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'maria@email.com'
    expect(page).to have_button 'Sign out'

    user = User.last
    expect(user.username).to eq 'Maria'
  end
end