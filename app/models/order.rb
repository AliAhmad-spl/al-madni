class Order < ApplicationRecord
	self.per_page = 10
	default_scope { order("created_at DESC") }
	belongs_to :user
	has_many :products

	enum status: { placed: 0, accepted: 1, delivered: 2, rejected: 3 }
end
