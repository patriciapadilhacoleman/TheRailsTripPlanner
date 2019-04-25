class Lodging < ApplicationRecord

  has_many :days
  has_many :trips,through: :days

end
