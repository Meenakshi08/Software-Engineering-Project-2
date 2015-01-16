class Customer < ActiveRecord::Base
 
  
  def self.all
    @customers = []
    customers_json = HTTParty.get('http://localhost:4000/users/2/customers/create.json').parsed_response
    customers_json.map {|b| @customers.push( Customer.new(:id => b['id'], :name => b['name'], :user_id => b['user_id']) )}
    return @customers
  end

  def self.find (id, uid)
    @customer = nil
    if not id.blank?
      customer_json = HTTParty.get('http://localhost:4000/users/1/customers/'+id.to_s+'.json').parsed_response
      if not customer_json.nil?
        @customer = Customer.new(:id => customer_json['id'], :name => customer_json['name'], :user_id => customer_json['user_id'] ) 
        return @customer
      end
      
    end
    
  end  
 
 def self.delete (id, uid)
    #@customer = nil
#	@customer = Customer.new(customer_params)
	@customer = Customer.new(:id => id, :name => nil, :user_id => uid ) 
	#@customer.user_id= uid
	#@customer.id= id
    if not id.blank?
	customer_json = HTTParty.post('http://localhost:4000/users/1/customers/'+id.to_s+'.json',
					{			
						:body => @customer.to_json,
						:headers => { 'Content-Type' => 'application/json',
						'Accept' => 'application/json' }
					}
		)

      if not customer_json.nil?
        @customer = Customer.new(:id => customer_json['id'], :name => customer_json['name'], :user_id => customer_json['user_id'] ) 
        
      end
      
    end
    
  end  
  
 
end
