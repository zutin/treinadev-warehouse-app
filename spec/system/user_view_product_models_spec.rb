require 'rails_helper'

describe 'User sees product models' do
  it 'from the home page' do
    #Arrange

    #Act
    visit root_path
    within('nav') do
      click_on 'Product Models'
    end

    #Assert
    expect(current_path).to eq product_models_path
  end

  it 'sees product models with success' do
    #Arrange
    supplier = Supplier.create!(corporate_name: 'Supplier Test', brand_name: 'Supplier Brand', registration_number: '999111555',
                                full_address: 'Rua das Palmeiras, 999', city: 'São Paulo', state: 'SP', email: 'supplier@test.com')
    ProductModel.create!(name: 'Notebook', sku: 'SON-32SNOTEBOOK', width: 40, height: 37, depth: 10, weight: 2200, supplier: supplier)
    ProductModel.create!(name: 'TV', sku: 'TLV-48PTELEVISAO', width: 178, height: 150, depth: 25, weight: 18000, supplier: supplier)

    #Act
    visit root_path
    within('nav') do
      click_on 'Product Models'
    end

    #Assert
    expect(page).to have_content('Notebook')
    expect(page).to have_content('SKU: SON-32SNOTEBOOK')
    expect(page).to have_content('Supplier Brand')
    expect(page).to have_content('TV')
    expect(page).to have_content('SKU: TLV-48PTELEVISAO')
    expect(page).to have_content('Supplier Brand')
  end

  it 'can see when there is no product models available' do
    #Arrange

    #Act
    visit root_path
    within('nav') do
      click_on 'Product Models'
    end

    #Assert
    expect(page).to have_content('There are no products available.')
  end
end