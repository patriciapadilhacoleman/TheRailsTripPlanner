class Trip < ApplicationRecord

  has_many :days
  has_many :tickets
  has_many :activities, through: :days
  has_many :lodgings, through: :days
  has_and_belongs_to_many :programmers


end
