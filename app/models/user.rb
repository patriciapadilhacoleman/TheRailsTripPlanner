class User < ApplicationRecord
  has_and_belongs_to_many :trips
  has_many :tickets, through: :trips

end
