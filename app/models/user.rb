class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email, :case_sensitive => false  
  
  def self.authenticate_with_credentials(email, password)
    email.strip!
    email.downcase!
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end 
  
  validates :password, presence: true, length: {minimum: 5}
  validates :password_confirmation, presence: true, length: {minimum: 5}
  validates :email, presence: true,  uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :last_name, presence: true
  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end
end