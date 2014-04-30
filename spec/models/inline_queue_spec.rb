require 'spec_helper'

describe InlineQueue do
	let(:queue) { InlineQueue.create name: "Jesse" }
	let(:member1) { InlineQueueMember.create id: "1", loc: Location.random }
	let(:member2) { InlineQueueMember.create id: "2", loc: Location.random}

	describe ".initialize" do
		subject { InlineQueue.create }
		its(:members) { should be_empty }
		its(:size) { should eq 0 }
	end

	describe ".enq" do	
		subject { 
			queue.enq member1
			queue.enq member2
			queue
		}

		its(:first) { should eq member1 }
		its(:last) { should eq member2 }
	end

	describe ".deq" do
		let(:queue) {
			q = InlineQueue.create
			q.members.push member1
			q.members.push member2
			q
		}

		describe "returning the dequeued member" do
			subject { queue.deq }
			it { should eq member1 }
		end

		describe "removing a deququed member" do
			subject { queue.tap &:deq }
			its(:size) { should eq 1 }
			its(:first) { should eq member2 }
		end

	end
end