require 'rails_helper'

describe 'User can edit a supplier' do
  it 'can see the edit form' do
    #Arrange
    supplier = Supplier.create!(corporate_name: 'Supplier Test', brand_name: 'Supplier Brand', registration_number: '999111555',
                                full_address: 'Rua das Palmeiras, 999', city: 'São Paulo', state: 'SP', email: 'supplier@test.com')

    #Act
    visit root_path
    within('nav') do
      click_on 'Suppliers'
    end

    click_on 'Supplier Test'
    click_on 'Edit'

    #Assert
    expect(page).to have_field('Corporate Name', with: 'Supplier Test')
    expect(page).to have_field('Brand Name', with: 'Supplier Brand')
    expect(page).to have_field('Registration Number', with: '999111555')
  end

  it 'can edit a supplier successfully' do
    #Arrange
    supplier = Supplier.create!(corporate_name: 'Supplier Test', brand_name: 'Supplier Brand', registration_number: '999111555',
                                full_address: 'Rua das Palmeiras, 999', city: 'São Paulo', state: 'SP', email: 'supplier@test.com')

    #Act
    visit root_path
    within('nav') do
      click_on 'Suppliers'
    end

    click_on 'Supplier Test'
    click_on 'Edit'

    fill_in 'Corporate Name', with: 'New Name'
    fill_in 'Brand Name', with: 'Super Brand'
    fill_in 'Registration Number', with: '444444'

    click_on 'Save'
    
    #Assert
    expect(page).to have_content('Supplier edited successfully.')
    expect(page).to have_content('New Name')
    expect(page).to have_content('Super Brand')
    expect(page).to have_content('444444')
  end

  it 'cannot edit suppllier if there is missing data' do
    #Arrange
    supplier = Supplier.create!(corporate_name: 'Supplier Test', brand_name: 'Supplier Brand', registration_number: '999111555',
                                full_address: 'Rua das Palmeiras, 999', city: 'São Paulo', state: 'SP', email: 'supplier@test.com')

    #Act
    visit root_path
    within('nav') do
    click_on 'Suppliers'
    end

    click_on 'Supplier Test'
    click_on 'Edit'

    fill_in 'Corporate Name', with: 'Super Name'
    fill_in 'Brand Name', with: ''
    fill_in 'Registration Number', with: ''

    click_on 'Save'

    #Assert
    expect(page).to have_content('Error while editing a supplier')
    expect(page).not_to have_content('Super Name')
  end
end