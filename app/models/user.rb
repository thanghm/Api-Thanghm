class User < ActiveRecord::Base
	EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates_uniqueness_of :email
  validates :email, format: { with: EMAIL_FORMAT, :allow_blank => true }
  validates_length_of :password, minimum: 8, maximum: 32, allow_blank: true
  validates_confirmation_of :password

  def ensure_authentication_token!
    self.authentication_token = generate_authentication_token
    self.save validate: false
  end

  def clear_authentication_token
    update(authentication_token: nil)
  end

	private
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
