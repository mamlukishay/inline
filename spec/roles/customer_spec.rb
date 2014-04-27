require 'spec_helper'

describe Customer do
	let(:queue) { InlineQueue.create }
	let(:member) { mock(id: 1, loc: Location.random, name: Faker::Name.name) }
	let(:customer) { Customer.new member }

	describe ".join_queue" do
		subject {	
			customer.join_queue queue	
			queue
		}

		its("last.id") { should eq customer.id.to_s }
	end
end