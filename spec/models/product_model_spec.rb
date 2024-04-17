require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'false when name is empty' do
        #Arrange
        sup = Supplier.create!(corporate_name: 'Supplier Test', brand_name: 'Supplier Brand', registration_number: '999111555',
        full_address: 'Rua das Palmeiras, 999', city: 'São Paulo', state: 'SP', email: 'supplier@test.com')

        pm = ProductModel.new(name: '', sku: 'TLV-48PTELEVISAO', width: 178, height: 150, depth: 25, weight: 18000, supplier: sup)

        #Act
        result = pm.valid?

        #Assert
        expect(result).to eq false
      end

      it 'false when sku is empty' do
        #Arrange
        sup = Supplier.create!(corporate_name: 'Supplier Test', brand_name: 'Supplier Brand', registration_number: '999111555',
        full_address: 'Rua das Palmeiras, 999', city: 'São Paulo', state: 'SP', email: 'supplier@test.com')

        pm = ProductModel.new(name: 'TV 48 polegadas', sku: '', width: 178, height: 150, depth: 25, weight: 18000, supplier: sup)

        #Act
        result = pm.valid?

        #Assert
        expect(result).to eq false
      end
    end
  end
end
