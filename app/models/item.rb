class Item < ApplicationRecord
	self.per_page = 10
	default_scope { order("created_at DESC") }
  belongs_to :user
  has_many :histories
  enum qty_type: { kg: 0, liter: 1, grams: 2 }
end
