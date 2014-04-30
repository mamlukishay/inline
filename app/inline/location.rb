class Location 
	attr_accessor :lat, :long
	
	def initialize(lat, long)
		@lat = lat
		@long = long
	end

	def self.random
		lat, long = *([rand * 90]*2)
	 	Location.new(lat, long)
	end

	def to_s
		self.to_json
	end
end