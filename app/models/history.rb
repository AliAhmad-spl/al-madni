class History < ApplicationRecord
	self.per_page = 10
	default_scope { order("created_at DESC") }
  belongs_to :item
  belongs_to :user
end
