class User < ApplicationRecord
  validates :user_name, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6 , allow_nil: true}
  after_initialize :ensure_session_token
  
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end
  
  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end
  
  private
  def ensure_session_token
    current_user.session_token ||= User.generate_session_token
  end
  
end
