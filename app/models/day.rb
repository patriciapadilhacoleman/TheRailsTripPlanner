class Day < ApplicationRecord
  belongs_to :trip
  belongs_to :lodging
  has_many :activities

end
