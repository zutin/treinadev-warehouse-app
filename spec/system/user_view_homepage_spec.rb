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
    Warehouse.create(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000)
    Warehouse.create(name: 'Maceió', code: 'MCZ', city: 'Maceió', area: 50_000)

    #Act
    visit('/')

    #Assert
    expect(page).not_to have_content('There is no registered warehouses')

    expect(page).to have_content('Rio')
    expect(page).to have_content('Código: SDU')
    expect(page).to have_content('Cidade: Rio de Janeiro')
    expect(page).to have_content('60000 m²')

    expect(page).to have_content('Maceió')
    expect(page).to have_content('Código: MCZ')
    expect(page).to have_content('Cidade: Maceió')
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