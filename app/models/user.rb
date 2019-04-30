class User < ActiveRecord::Base
  has_and_belongs_to_many :trips
  has_many :tickets, through: :trips
  has_secure_password

  def self.create_with_omniauth(auth)

    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.name.split(' ').first
      user.last_name = auth.info.name.split(' ').last
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = SecureRandom.hex(20)
      user.save!
    end
  end

end
