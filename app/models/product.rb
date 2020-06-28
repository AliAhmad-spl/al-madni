class Product < ApplicationRecord
	belongs_to :one_menu, optional: true
	belongs_to :order, optional: true
	enum product_type: {small: 0, medium: 1, large: 2} 
end
