require 'rails_helper'

describe 'User edits a warehouse' do
  it 'can see the edit form from the warehouse details page' do
    #Arrange
    warehouse = Warehouse.create!(name: 'São Paulo', code: 'GRU', city: 'Guarulhos', area: 100_000,
    address: 'Avenida do Aeroporto, 1000', zipcode: '15000-000',
    description: 'This warehouse is designed to receive international freight.')

    #Act
    visit root_path
    click_on 'São Paulo'
    click_on 'Edit'

    #Assert
    expect(page).to have_content 'Edit Warehouse'
    expect(page).to have_field('Warehouse Name', with: 'São Paulo')
    expect(page).to have_field('Code', with: 'GRU')
    expect(page).to have_field('Area (M²)', with: '100000')
    expect(page).to have_field('City', with: 'Guarulhos')
    expect(page).to have_field('Address', with: 'Avenida do Aeroporto, 1000')
    expect(page).to have_field('Zip Code', with: '15000-000')
    expect(page).to have_field('Description', with: 'This warehouse is designed to receive international freight.')
  end

  it 'can edit a warehouse with success' do
    #Arrange
    warehouse = Warehouse.create!(name: 'São Paulo', code: 'GRU', city: 'Guarulhos', area: 100_000,
    address: 'Avenida do Aeroporto, 1000', zipcode: '15000-000',
    description: 'This warehouse is designed to receive international freight.')

    #Act
    visit root_path
    click_on 'São Paulo'
    click_on 'Edit'
    fill_in 'Warehouse Name', with: 'SP Oldest Warehouse'
    fill_in 'Area (M²)', with: '200000'
    fill_in 'Code', with: 'SPW'
    click_on 'Save'

    #Assert
    expect(page).to have_content('Warehouse edited successfully.')
    expect(page).to have_content('SPW Warehouse')
    expect(page).to have_content('SP Oldest Warehouse')
    expect(page).to have_content('Area: 200000 m²')
    expect(page).to have_content('City: Guarulhos')
    expect(page).to have_content('Address: Avenida do Aeroporto, 1000')
    expect(page).to have_content('Zip Code: 15000-000')
    expect(page).to have_content('This warehouse is designed to receive international freight.')
  end

  it 'will persist the required fields' do
    #Arrange
    warehouse = Warehouse.create!(name: 'São Paulo', code: 'GRU', city: 'Guarulhos', area: 100_000,
    address: 'Avenida do Aeroporto, 1000', zipcode: '15000-000',
    description: 'This warehouse is designed to receive international freight.')

    #Act
    visit root_path
    click_on 'São Paulo'
    click_on 'Edit'
    fill_in 'Warehouse Name', with: ''
    fill_in 'Area (M²)', with: ''
    fill_in 'Code', with: ''
    click_on 'Save'

    #Assert
    expect(page).to have_content('It was not possible to edit this warehouse.')
  end
end