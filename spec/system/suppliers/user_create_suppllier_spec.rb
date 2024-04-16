require 'rails_helper'

describe 'User creates a new supplier' do
  it 'can see the new supplier form' do
    #Arrange

    #Act
    visit root_path
    within('nav') do
      click_on 'Suppliers'
    end

    click_on 'New supplier'

    #Assert
    expect(page).to have_field('Corporate Name')
    expect(page).to have_field('Brand Name')
    expect(page).to have_field('Registration Number')
    expect(page).to have_field('Full Address')
    expect(page).to have_field('City')
    expect(page).to have_field('State')
    expect(page).to have_field('Email')
  end

  it 'can create a new supplier successfully' do
    #Arrange

    #Act
    visit root_path
    within('nav') do
      click_on 'Suppliers'
    end
    click_on 'New supplier'

    fill_in 'Corporate Name', with: 'Corporate Test'
    fill_in 'Brand Name', with: 'Brand Test'
    fill_in 'Registration Number', with: '999111'
    fill_in 'Full Address', with: 'Rua da Avenida, 123'
    fill_in 'City', with: 'Cidadezinha'
    fill_in 'State', with: 'Estadoado'
    fill_in 'Email', with: 'supplier@test.com'

    click_on 'Save'

    #Assert
    expect(current_path).to eq suppliers_path
    expect(page).to have_content('Supplier created successfully.')
    expect(page).to have_content('Corporate Test')
    expect(page).to have_content('Brand Test')
    expect(page).to have_content('999111')
  end

  it 'cannot create a supplier with missing data' do
    #Arrange

    #Act
    visit root_path
    within('nav') do
      click_on 'Suppliers'
    end
    click_on 'New supplier'

    fill_in 'Corporate Name', with: ''
    fill_in 'Brand Name', with: 'Brand Test'
    fill_in 'Registration Number', with: '999111'
    fill_in 'Full Address', with: 'Rua da Avenida, 123'
    fill_in 'City', with: 'Cidadezinha'
    fill_in 'State', with: 'Estadoado'
    fill_in 'Email', with: 'supplier@test.com'

    click_on 'Save'

    #Assert
    expect(page).to have_content('Error while creating a supplier.')
    expect(page).not_to have_content('Corporate Test')
    expect(page).not_to have_content('Brand Test')
    expect(page).not_to have_content('999111')
  end
end