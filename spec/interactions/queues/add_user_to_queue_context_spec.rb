require 'spec_helper'

describe Queues::AddUserToQueueContext do
	let(:user) { User.new }
	let(:queue) { Queue.new }

	describe ".run" do
		it "should add the user to the queue" do
			context = Queues::AddUserToQueueContext.new user, queue
			user.should_receive(:join_queue).with queue
			context.run
		end
	end	
end