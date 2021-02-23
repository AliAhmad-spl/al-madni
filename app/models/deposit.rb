class Deposit < ApplicationRecord
  belongs_to :account
  enum status: [:deposit, :paid]
end
