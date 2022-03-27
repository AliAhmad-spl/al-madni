class Product < ApplicationRecord
	belongs_to :one_menu
	belongs_to :hotel
	enum product_type: {small: 0, medium: 1, large: 2} 
end
