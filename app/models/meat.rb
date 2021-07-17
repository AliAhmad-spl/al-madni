class Meat < ApplicationRecord
  belongs_to :accounts

  enum cat_type: [:chicken, :mutton, :beef]
end
