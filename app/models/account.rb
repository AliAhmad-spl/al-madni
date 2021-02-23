class Account < ApplicationRecord
  belongs_to :hotel
  has_many :detail_milks
  has_many :advances 
  has_many :deposits
  enum user_type: [:milk_man, :butcher, :sale_man]
end
