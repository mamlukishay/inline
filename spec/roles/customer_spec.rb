require 'spec_helper'

describe Customer do
	let(:queue) { Queue.new }
	let(:customer) { Customer.new Object.new }

	describe ".join_queue" do
		subject {	
			customer.join_queue queue	
			queue
		}

		its(:last) { should eq customer }
	end
end