require 'rails_helper'

describe 'User authenticates' do
  it 'can authenticate successfully' do
    #Arrange
    User.create!(username: 'user', email: 'user@test.com', password: 'password')

    #Act
    visit root_path
    click_on 'Sign in'

    within('form') do
      fill_in 'E-mail', with: 'user@test.com'
      fill_in 'Senha', with: 'password'

      click_on 'Log in'
    end

    #Assert
    expect(page).to have_content 'Login efetuado com sucesso.'
    expect(page).not_to have_link 'Sign in'
    expect(page).to have_link 'Sign out'
    within('nav') do
      expect(page).to have_content 'user@test.com'
    end
  end
end