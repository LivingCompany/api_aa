class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :providers, dependent: :destroy

    # Use this before callback to set up User access_token.
  before_save :ensure_authentication_token

  # If the user has no access_token, generate one.
  def ensure_authentication_token
    if access_token.blank?
      self.access_token = generate_access_token
    end
  end

  private

    def generate_access_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(access_token: token).first
      end
	end
end
