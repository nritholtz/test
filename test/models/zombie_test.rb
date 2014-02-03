require 'test_helper'

class ZombieTest < ActiveSupport::TestCase

	def setup
		@z= FactoryGirl.create(:zombie)
	end
	
	should validate_presence_of(:name)
	should have_many(:tweets)

 	test "valid with all attributes" do
 		assert @z.valid?, 'Zombie was not valid'
 	end
 
 	test "invalid name gives errors" do
 		@z.name=nil
 		@z.valid?
 		assert_presence(@z, :name)
 	end

 	test "can generate avatar_url" do
 		assert_equal "http://zombitar.com/#{@z.id}.jpg", @z.avatar_url
 	end

 	test "should respond to tweets" do
 		assert_respond_to @z, :tweets
 	end

 	test "should contain only tweets that belong to zombie" do
 		assert @z.tweets.all? {|t| t.zombie==@z}
 	end
end