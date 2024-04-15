class Warehouse < ApplicationRecord
  validates :name, :code, :city, :area, :address, :zipcode, :description, presence: true
end
