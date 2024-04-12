require 'rails_helper'

describe 'User checks warehouse details' do
  it 'can see additional warehouse information' do
    #Arrange
    Warehouse.create(name: 'São Paulo', code: 'GRU', city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 1000', zipcode: '15000-000',
                      description: 'This warehouse is designed to receive international freight.')

    #Act
    visit(root_path)
    click_on('São Paulo')

    #Assert
    expect(page).to have_content('GRU Warehouse')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content('City: Guarulhos')
    expect(page).to have_content('Area: 100000 m²')
    expect(page).to have_content('Address: Avenida do Aeroporto, 1000 Zip Code: 15000-000')
    expect(page).to have_content('This warehouse is designed to receive international freight.')
  end

  it 'can go back to home page' do
    #Arrange
    Warehouse.create(name: 'São Paulo', code: 'GRU', city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 1000', zipcode: '15000-000',
                      description: 'This warehouse is designed to receive international freight.')

    #Act
    visit(root_path)
    click_on('São Paulo')
    click_on('Back')

    #Assert
    expect(current_path).to eq(root_path)
  end
end