class InlineQueue < Ohm::Model
	attribute :name
	list :members, :InlineQueueMember

	def size
		members.size
	end

	def enq(member)
		members.push member
	end

	def deq
		retval = first
		members.delete first
		retval
	end

	def first
		members.first
	end

	def last
		members.last
	end
end