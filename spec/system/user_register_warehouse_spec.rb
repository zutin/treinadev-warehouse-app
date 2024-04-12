require 'rails_helper'

describe 'User registers a new warehouse' do
  it 'from home page' do
    #Arrange

    #Act
    visit root_path
    click_on 'New Warehouse'

    #Assert
    expect(page).to have_field('Warehouse Name')
    expect(page).to have_field('Code')
    expect(page).to have_field('Area (M²)')
    expect(page).to have_field('City')
    expect(page).to have_field('Address')
    expect(page).to have_field('Zip Code')
    expect(page).to have_field('Description')
  end

  it 'with success' do
    #Arrange

    #Act
    visit root_path
    click_on 'New Warehouse'
    fill_in 'Warehouse Name', with: 'Rio de Janeiro'
    fill_in 'Code', with: 'RIO'
    fill_in 'Area (M²)', with: '32000'
    fill_in 'City', with: 'Rio de Janeiro'
    fill_in 'Address', with: 'Avenida do Museu do Amanhã, 1000'
    fill_in 'Zip Code', with: '20100-000'
    fill_in 'Description', with: 'This warehouse is located at the north side harbors of Rio'
    click_on 'Create'

    #Assert
    expect(current_path).to eq root_path
    expect(page).to have_content('Rio de Janeiro')
    expect(page).to have_content('RIO')
    expect(page).to have_content('32000 m²')
  end
end