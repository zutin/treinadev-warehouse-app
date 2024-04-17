require 'rails_helper'

describe 'User creates a product model' do
  it 'can create a new product successfully' do
    #Arrange
    supplier = Supplier.create!(corporate_name: 'Supplier Test', brand_name: 'Supplier Brand', registration_number: '999111555',
                                full_address: 'Rua das Palmeiras, 999', city: 'São Paulo', state: 'SP', email: 'supplier@test.com')

    other_supplier = Supplier.create!(corporate_name: 'LG', brand_name: 'LifesGood', registration_number: '123456789',
                                full_address: 'Rua das Aves, 123', city: 'Rio de Janeiro', state: 'RJ', email: 'ele@ge.com')

    #Act
    visit root_path
    click_on 'Product Models'
    click_on 'New Product Model'

    fill_in 'Name', with: 'TV 40 polegadas'
    fill_in 'Weight', with: 10_000
    fill_in 'Height', with: 60
    fill_in 'Width', with: 90
    fill_in 'Depth', with: 10
    fill_in 'SKU', with: 'TV40-SANS-XPTO'
    select 'Supplier Brand', from: 'Suppliers'

    click_on 'Save'

    #Assert
    expect(page).to have_content('Product model created successfully.')
    expect(page).to have_content('TV 40 polegadas')
    expect(page).to have_content('SKU: TV40-SANS-XPTO')
    expect(page).to have_content('Dimensions: 60cm x 90cm x 10cm')
    expect(page).to have_content('Weight: 10000')
    expect(page).to have_content('Supplier: Supplier Brand')
  end

  it 'cannot create a new product model with missing data' do
    #Arrange
    supplier = Supplier.create!(corporate_name: 'Supplier Test', brand_name: 'Supplier Brand', registration_number: '999111555',
                                full_address: 'Rua das Palmeiras, 999', city: 'São Paulo', state: 'SP', email: 'supplier@test.com')

    #Act
    visit root_path
    click_on 'Product Models'
    click_on 'New Product Model'

    fill_in 'Name', with: ''
    fill_in 'SKU', with: ''

    click_on 'Save'

    #Assert
    expect(page).to have_content('Error while creating a product model.')
  end
end