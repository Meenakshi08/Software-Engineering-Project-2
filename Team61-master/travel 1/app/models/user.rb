class User < ActiveRecord::Base
 
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  def self.all
    @users = []
    users_json = HTTParty.get('http://localhost:4000/users.json').parsed_response
    users_json.map {|b| @users.push( User.new(:id => b['id'], :username => b['username'], :wpass => b['wpass'], 
          :email => b['email'], :first_name => b['first_name'], :last_name => b['last_name'], 
          :dob => b['dob'], :agent_id => b['agent_id'], :post => b['post'], :address => b['address'], 
          :contact => b['contact'], :encrypted_password => b['encrypted_password'], :salt => b['salt'], :cab => b['cab'], :bus => b['bus'], 
          :train => b['train'], :flight => b['flight'], :hotel => b['hotel'], :password => b['password'] ) )}
    return @users
  end

  def self.find (id)
    @user = nil
    if not id.blank?
      user_json = HTTParty.get('http://localhost:4000/users/'+id.to_s+'.json').parsed_response
      if not user_json.nil?
        @user = User.new(:id => user_json['id'], :username => user_json['username'], :wpass => user_json['wpass'], 
          :email => user_json['email'], :first_name => user_json['first_name'], :last_name => user_json['last_name'], 
          :dob => user_json['dob'], :agent_id => user_json['agent_id'], :post => user_json['post'], :address => user_json['address'], 
          :contact => user_json['contact'], :encrypted_password => user_json['encrypted_password'], :salt => user_json['salt'], 
          :cab => user_json['cab'], :bus => user_json['bus'], :train => user_json['train'], 
          :flight => user_json['flight'], :hotel => user_json['hotel'], :password => user_json['password'] ) 
        return @user
      end
    end
  end  
  
end
