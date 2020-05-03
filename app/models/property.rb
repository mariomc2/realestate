class Property < ApplicationRecord
	belongs_to :building
	has_many :managements
	has_many :users, through: :managements
end
