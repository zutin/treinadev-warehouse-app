require 'rails_helper'

describe 'User registers an order' do
  it 'with success' do
    #Arrange
    user = User.create!(username: 'user', email: 'user@test.com', password: 'password')
    warehouse = Warehouse.create!(name: 'São Paulo', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', zipcode: '15000-000',
                                  description: 'This warehouse is designed to receive international freight.')
    Warehouse.create!(name: 'Rio de Janeiro', code: 'RIO', city: 'Lapa', area: 300_000,
                                  address: 'Avenida das flores, 99900', zipcode: '32029-000',
                                  description: 'Rio Warehouse is awesome')
    supplier = Supplier.create!(corporate_name: 'Supplier Test', brand_name: 'Supplier Brand', registration_number: '999111555',
                                full_address: 'Rua das Palmeiras, 999', city: 'São Paulo', state: 'SP', email: 'supplier@test.com')
    Supplier.create!(corporate_name: 'LG', brand_name: 'LifesGood', registration_number: '123456789',
                                full_address: 'Rua das Aves, 123', city: 'Rio de Janeiro', state: 'RJ', email: 'ele@ge.com')

    #Act
    login_as(user)
    visit root_path
    click_on 'Registrar Pedido'

    select warehouse.name, from: 'Galpão Destino'
    select supplier.corporate_name, from: 'Fornecedor'
    fill_in 'Data Prevista', with: '20/12/2024'
    click_on 'Salvar'

    #Assert
    expect(page).to have_content('Pedido registrado com sucesso')
    expect(page).to have_content('Galpão Destino: São Paulo')
    expect(page).to have_content('Fornecedor: Supplier Test')
    expect(page).to have_content('Usuário Responsável: user <user@test.com>')
    expect(page).not_to have_content('Rio de Janeiro')
    expect(page).not_to have_content('LG')
  end
end