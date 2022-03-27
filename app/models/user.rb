class User < ApplicationRecord
	has_many :foods
	has_many :items
	has_many :histories
  has_many :detail_milks
	has_many :user_hotels
	has_many :hotels, through: :user_hotels

  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  	has_many :orders

  	validates :name, :email, uniqueness: true
end
