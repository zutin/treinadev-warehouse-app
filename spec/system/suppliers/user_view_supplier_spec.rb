require 'rails_helper'

describe 'User sees suppliers list' do
  it 'from the home page' do
    #Arrange

    #Act
    visit root_path
    within('nav') do
      click_on 'Suppliers'
    end

    #Assert
    expect(current_path).to eq suppliers_path
  end

  it 'can see the supplier info' do
    #Arrange
    supplier = Supplier.create!(corporate_name: 'Supplier Test', brand_name: 'Supplier Brand', registration_number: '999111555',
                                full_address: 'Rua das Palmeiras, 999', city: 'São Paulo', state: 'SP', email: 'supplier@test.com')

    #Act
    visit root_path
    within('nav') do
      click_on 'Suppliers'
    end

    click_on 'Supplier Test'

    #Assert
    expect(page).to have_content('Supplier Test')
    expect(page).to have_content('Supplier Brand')
    expect(page).to have_content('999111555')
    expect(page).to have_content('Rua das Palmeiras, 999')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content('SP')
    expect(page).to have_content('supplier@test.com')
  end

  it 'can see when there is no suppliers' do
    #Arrange

    #Act
    visit root_path
    within('nav') do
      click_on 'Suppliers'
    end

    #Assert
    expect(page).to have_content('No supplier found.')
  end
end