require 'rails_helper'

describe 'User registers a new warehouse' do
  it 'can see the registration form from home page' do
    #Arrange

    #Act
    visit root_path
    click_on 'New Warehouse'

    #Assert
    expect(page).to have_field('Warehouse Name')
    expect(page).to have_field('Code')
    expect(page).to have_field('Area (M²)')
    expect(page).to have_field('City')
    expect(page).to have_field('Address')
    expect(page).to have_field('Zip Code')
    expect(page).to have_field('Description')
  end

  it 'can register a new warehouse with success' do
    #Arrange

    #Act
    visit root_path
    click_on 'New Warehouse'
    fill_in 'Warehouse Name', with: 'Rio de Janeiro'
    fill_in 'Code', with: 'RIO'
    fill_in 'Area (M²)', with: '32000'
    fill_in 'City', with: 'Rio de Janeiro'
    fill_in 'Address', with: 'Avenida do Museu do Amanhã, 1000'
    fill_in 'Zip Code', with: '20100-000'
    fill_in 'Description', with: 'This warehouse is located at the north side harbors of Rio'
    click_on 'Create'

    #Assert
    expect(current_path).to eq root_path
    expect(page).to have_content('Warehouse registered successfully.')
    expect(page).to have_content('Rio de Janeiro')
    expect(page).to have_content('RIO')
    expect(page).to have_content('32000 m²')
  end

  it 'cannot register a warehouse with missing data' do
    #Arrange

    #Act
    visit root_path
    click_on 'New Warehouse'
    fill_in 'Warehouse Name', with: ''
    fill_in 'Code', with: ''
    fill_in 'Description', with: ''
    click_on 'Create'

    #Assert
    expect(page).to have_content('You must provide all warehouse data.')
    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Cidade não pode ficar em branco')
    expect(page).to have_content('Endereço não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
    expect(page).to have_content('Código não pode ficar em branco')
    expect(page).to have_content('Área não pode ficar em branco')
    expect(page).to have_content('CEP não pode ficar em branco')

  end
end