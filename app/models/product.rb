class Product < ActiveRecord::Base
  before_create :generate_token
  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(4, false)
      break random_token unless self.class.exists?(token: random_token)
    end
  end
end
