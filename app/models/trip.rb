class Trip < ApplicationRecord
  has_many :tickets
  has_many :days
  has_many :activities, through: :days
  has_and_belongs_to_many :users

  scope :done, ->(day) { where("end_date < ?", day) }

end
