require 'rails_helper'

describe 'User visits home page' do
  it 'can see the application name' do
    #Arrange

    #Act
    visit('/')

    #Assert
    expect(page).to have_content('Warehouses & Stock')
  end

  # it '' do
    
  # end

  # it '' do
    
  # end
end