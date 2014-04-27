require 'spec_helper'

describe Queues::AddUserToQueueContext do
	let(:user) { User.new }
	let(:queue) { InlineQueue.create }

	describe ".run" do
		let(:customer) { double('customer', join_queue: true) }

		it "should add the user to the queue" do
			Customer.stub(:new).with(user) { customer }
			context = Queues::AddUserToQueueContext.new user, queue
			customer.should_receive(:join_queue).with queue
			context.run
		end
	end	
end