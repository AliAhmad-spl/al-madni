class Account < ApplicationRecord
  belongs_to :hotel
  has_many :detail_milks
  enum user_type: [:employee, :milk_man, :butcher, :cook, :sale_man, :security_guard, :waiter]
end
