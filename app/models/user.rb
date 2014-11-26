class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chunks
  
  before_validation :ensure_authentication_token

  validates :authentication_token, presence: true, uniqueness: true

  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end

  private

    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.find_by(authentication_token: token)
      end
    end
end
