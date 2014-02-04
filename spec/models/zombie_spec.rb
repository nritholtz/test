	require 'spec_helper'
	describe Zombie do
		let(:ash) {Zombie.new(name: "Ash Clone 1")}
		it "is invalid without a name" do
			should validate_presence_of(:name)
		end

		it "has a name that matches 'Ash Clone'" do
			expect(ash.name).to match(/Ash Clone \d/)
		end

		it 'includes tweets', tweets: true do
			tweet1 = Tweet.new(message: 'test')
			tweet2 = Tweet.new(message: 'test')
			ash.tweets = [tweet1, tweet2]
			expect(ash.tweets).to include(tweet1)
			expect(ash.tweets).to include(tweet2)
		end	

			its('tweets.size'){should == 0}

		it "when created changes the number of Zombies" do
			expect {ash.save}.to change {Zombie.count}.by(1)
		end

		it "raises an error if saved without a name" do
			expect{ subject.save!}.to raise_error(ActiveRecord::RecordInvalid)
		end

		it {should respond_to(:name)}

		context "who is rotting", rotting: true do
			subject{Zombie.new(rotting: true)}
			it_behaves_like 'the undead', Zombie.new(rotting: true)
			its(:rotting){should == true}
		end
	end
