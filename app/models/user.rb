class User < ActiveRecord::Base
  has_and_belongs_to_many :trips
  has_many :tickets, through: :trips
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true
  validates :first_name, :last_name, presence: true, length: { in:2..20 }
  validates :phone, length: { is: 10 }




  scope :admin, -> { where(admin: true) }

  def self.create_with_omniauth(auth)

    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.name.split(' ').first
      user.last_name = auth.info.name.split(' ').last
      #user.oauth_token = auth.credentials.token
      #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = SecureRandom.hex(20)
      user.save!
    end
  end

end
