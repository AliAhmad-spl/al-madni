class OneMenu < ApplicationRecord
	has_many :products
	belongs_to :hotel
end
