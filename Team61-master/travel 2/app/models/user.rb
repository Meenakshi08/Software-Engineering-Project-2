class User < ActiveRecord::Base


  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :username, :presence => true , :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true , :uniqueness => true #:format => EMAIL_REGEX
  #validates_confirmation_of :wpass
  #validates_length_of :password, :in => 1..20, :on => :create
  #validates :first_name , :presence => true , :length => { :in => 5..20 },  :format => { with: /\A[a-zA-Z]+\z/, message: "only allows letters" } 
  #validates :last_name, :presence => true , :length => { :in=> 5..20 },  :format => { with: /\A[a-zA-Z]+\z/, message: "only allows letters" } 
  #validates :dob, :presence => true
  #validates :agent_id, :presence => true
  #validates :post, :presence => true
  #validates :address, :presence => true
  #validates :contact, :presence => true, :length => { :maximum => 11 }, :format => { with: /\A[+-]?\d+\Z/, message: "only allows numbers" }
  


	def authenticate()
		user = User.find_by_username(self.username)
		if(!user.nil?)
			 if(self.wpass.eql? user.wpass)
				return user			 
			 else
			 	return nil
			 end	
		else
			return nil			
		end				
	end

	

end
