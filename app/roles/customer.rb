class Customer < SimpleDelegator
	def join_queue(queue)
		queue.enqueue self
	end
end