	require 'spec_helper'
	describe Zombie do
		it "is invalid without a name" do
			should_not be_valid
		end

		it "has a name that matches 'Ash Clone'" do
			zombie = Zombie.new(name: "Ash Clone 1")
			expect(zombie.name).to match(/Ash Clone \d/)
		end

		it 'includes tweets' do
			tweet1 = Tweet.new(message: 'test')
			tweet2 = Tweet.new(message: 'test')
			zombie= Zombie.new(name:'Ash', tweets:[tweet1,tweet2])
			expect(zombie.tweets).to include(tweet1)
			expect(zombie.tweets).to include(tweet2)
		end	

			its('tweets.size'){should == 0}

		it "changes the number of Zombies" do
			zombie = FactoryGirl.build(:zombie)
			expect {zombie.save}.to change {Zombie.count}.by(1)
		end

		it "raises an error if saved without a name" do
			expect{ subject.save!}.to raise_error(ActiveRecord::RecordInvalid)
		end

		it {should respond_to(:name)}
	end
