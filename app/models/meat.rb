class Meat < ApplicationRecord
  belongs_to :account

  enum cat_type: [:chicken, :mutton, :beef, :chotay_paye, :bady_paye]
end
