class Airline < ActiveRecord::Base

def self.find (id)
    @airline = nil
    if not id.blank?
      airline_json = HTTParty.get('http://localhost:5001/airlines/search/'+id.to_s+'.json').parsed_response
      if not airline_json.nil?
        @airline = Airline.new(:id => airline_json['id'], :user_id=> id, :airline_name => airline_json['airline_id'] ) 
        return @airline
      end
    end
  end  

end
