require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'false when name is empty' do
        warehouse = Warehouse.new(name: '', code: 'RIO', address: 'Address',
                                  zipcode: '25000-000', city: 'Rio de Janeiro',
                                  area: 1000, description: 'An awesome description')
        expect(warehouse.valid?).to eq false
      end

      it 'false when code is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio Warehouse', code: '', address: 'Address',
                                  zipcode: '25000-000', city: 'Rio de Janeiro',
                                  area: 1000, description: 'An awesome description')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when address is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio Warehouse', code: 'RIO', address: '',
                                  zipcode: '25000-000', city: 'Rio de Janeiro',
                                  area: 1000, description: 'An awesome description')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when zip code is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio Warehouse', code: 'RIO', address: 'Address',
                                  zipcode: '', city: 'Rio de Janeiro',
                                  area: 1000, description: 'An awesome description')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when city is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio Warehouse', code: 'RIO', address: 'Address',
                                  zipcode: '25000-000', city: '',
                                  area: 1000, description: 'An awesome description')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when area is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio Warehouse', code: 'RIO', address: 'Address',
                                  zipcode: '25000-000', city: 'Rio de Janeiro',
                                  description: 'An awesome description')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when description is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio Warehouse', code: 'RIO', address: 'Address',
                                  zipcode: '25000-000', city: 'Rio de Janeiro',
                                  area: 1000, description: '')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end
    end

    context 'uniqueness' do
      it 'false when code is already in use' do
        #Arrange
          first_warehouse = Warehouse.create(name: 'Rio Warehouse', code: 'RIO', address: 'Address',
                                          zipcode: '25000-000', city: 'Rio de Janeiro',
                                          area: 1000, description: 'An awesome description')

          second_warehouse = Warehouse.new(name: 'Niteroi', code: 'RIO', address: 'Avenue',
                                          zipcode: '31000-000', city: 'Niteroi',
                                          area: 2500, description: 'A not so awesome description')
        #Act
        result = second_warehouse.valid?

        #Assert
        expect(result).to eq false
      end
    end
  end
end