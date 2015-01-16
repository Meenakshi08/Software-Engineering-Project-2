class User < ActiveRecord::Base
  has_many :login
  attr_accessor :password

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create
  validates :first_name, :presence => true, :length => { :in => 5..20 },
  :format => { with: /\A[a-zA-Z]+\z/, message: "only allows letters" } 
  validates :last_name, :presence => true, :length => { :in=> 5..20 },
  :format => { with: /\A[a-zA-Z]+\z/, message: "only allows letters" } 
  validates :dob, :presence => true
  validates :agent_id, :presence => true
  validates :post, :presence => true
  validates :address, :presence => true
  validates :contact, :presence => true, :length => { :maximum => 11 },
  :format => { with: /\A[+-]?\d+\Z/, message: "only allows numbers" }
  
  
before_save :encrypt_password
after_save :clear_password
def encrypt_password
  if password.present?
    self.salt = BCrypt::Engine.generate_salt
    self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
  end
end
def clear_password
  self.password = nil
end


#def self.authenticate(username_or_email, password)
#  if EMAIL_REGEX.match(username_or_email)
#	user = User.find_by_email(username_or_email)
#  else
#	user = User.find_by_username(username_or_email)
#  end
#  if user && user.password_hash == BCrypt::Engine.hash_secret (password, user.password_salt)
#    user
#  else
#    nil
#  end
#end

def self.authenticate(username_or_email="", login_password="")
  if  EMAIL_REGEX.match(username_or_email)    
    user = User.find_by_email(username_or_email)
  else
    user = User.find_by_username(username_or_email)
  end
  if user && user.match_password(login_password)
    return user
  else
    return false
  end
end   
def match_password(login_password="")
  encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
end

  
end
