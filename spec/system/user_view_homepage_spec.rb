require 'rails_helper'

describe 'User visits home page' do
  it 'can see the application name' do
    #Arrange

    #Act
    visit('/')

    #Assert
    expect(page).to have_content('Warehouses & Stock')
  end

  it 'can see registered warehouses' do
    #Arrange
    Warehouse.create(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, 
                    address: 'Av. do Porto, 1000', zipcode: '20000-000', description: 'This is the Rio de Janeiro warehouse')
    Warehouse.create(name: 'Maceió', code: 'MCZ', city: 'Maceió', area: 50_000,
                    address: 'Av. do Atlântica, 50', zipcode: '80000-000', description: 'This warehouse is located near the airport')

    #Act
    visit('/')

    #Assert
    expect(page).not_to have_content('There is no registered warehouses')

    expect(page).to have_content('Rio')
    expect(page).to have_content('Code: SDU')
    expect(page).to have_content('City: Rio de Janeiro')
    expect(page).to have_content('60000 m²')

    expect(page).to have_content('Maceió')
    expect(page).to have_content('Code: MCZ')
    expect(page).to have_content('City: Maceió')
    expect(page).to have_content('50000 m²')
  end

  it 'can see when there is no registered warehouses' do
    #Arrange

    #Act
    visit('/')

    #Assert
    expect(page).to have_content('There is no registered warehouses')
  end
end