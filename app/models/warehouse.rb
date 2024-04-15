class Warehouse < ApplicationRecord
  validates :name, :code, :city, :area, :address, :zipcode, :description, presence: true
  validates :code, uniqueness: true
end
