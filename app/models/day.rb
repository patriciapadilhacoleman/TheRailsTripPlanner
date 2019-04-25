class Day < ApplicationRecord

  has_many :activities
  belongs_to :lodging
  belongs_to :trip

end
