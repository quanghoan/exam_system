class User < ActiveRecord::Base
  has_many :time_infos, dependent: :destroy
  has_many :login_attempts, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :subjects, through: :user_subjects
  has_many :grades, dependent: :destroy
  has_many :results
	has_many :tests, dependent: :destroy
  attr_accessor :remember_token, :reset_token
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  # validates :password, presence: true, length: {minimum: 6}

  def send_password
    UserMailer.sendmail(self).deliver_now
  end

  def login_limit?
    if !self.admin?
      self.login_attempts.count > 4
    end 
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      # user.oauth_token = auth.credentials.token
      # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = SecureRandom.urlsafe_base64      
      user.save!
    end
  end
  
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

   # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns true if the given token matches the digest.
  # def authenticated?(remember_token)
  #   return false if remember_digest.nil?
  #   BCrypt::Password.new(remember_digest).is_password?(remember_token)
  # end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
end