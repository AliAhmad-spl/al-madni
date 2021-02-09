class Hotel < ApplicationRecord
  has_many :user_hotels
  has_many :users, through: :user_hotels
  has_many :one_menus
  has_many :orders
  has_many :user_requests
end
