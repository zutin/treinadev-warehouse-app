require 'rails_helper'

describe 'User deletes a warehouse' do
  it 'can delete a warehouse with success' do
    #Arrange
    warehouse = Warehouse.create!(name: 'São Paulo', code: 'GRU', city: 'Guarulhos', area: 100_000,
    address: 'Avenida do Aeroporto, 1000', zipcode: '15000-000',
    description: 'This warehouse is designed to receive international freight.')

    #Act
    visit root_path
    click_on 'São Paulo'
    click_on 'Delete'

    #Assert
    expect(current_path).to eq root_path
    expect(page).to have_content('Warehouse deleted successfully.')
    expect(page).not_to have_content('São Paulo')
    expect(page).not_to have_content('GRU')
  end

  it 'will only delete the selected warehouse' do
    #Arrange
    first_warehouse = Warehouse.create!(name: 'São Paulo', code: 'GRU', city: 'Guarulhos', area: 100_000,
    address: 'Avenida do Aeroporto, 1000', zipcode: '15000-000',
    description: 'This warehouse is designed to receive international freight.')

    second_warehouse = Warehouse.create!(name: 'Rio de Janeiro', code: 'RIO', city: 'Lapa', area: 300_000,
    address: 'Avenida das flores, 99900', zipcode: '32029-000',
    description: 'Rio Warehouse is awesome')

    #Act
    visit root_path
    click_on 'São Paulo'
    click_on 'Delete'

    #Assert
    expect(current_path).to eq root_path
    expect(page).to have_content('Warehouse deleted successfully.')
    expect(page).to have_content('Rio de Janeiro')
    expect(page).not_to have_content('São Paulo')
  end
end