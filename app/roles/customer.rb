class Customer < SimpleDelegator
	def loc
		Location.random
	end

	def join_queue(queue)
		queue.enq self
	end
end