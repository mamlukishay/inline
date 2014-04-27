class Queues::AddUserToQueueContext
	attr_reader :user, :queue

	def self.run(user,queue)
		AddUserToQueueContext.new(user, queue).run
	end

	def initialize(user, queue)
		@queue = queue
		@customer = Customer.new user		
	end

	def run
		@customer.join_queue @queue
	end
end