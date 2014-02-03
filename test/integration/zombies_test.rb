require 'test_helper'
require 'capybara/rails'

class ZombiesTest < ActionDispatch::IntegrationTest
 
 	test "Anyone can view zombie information" do
 	 	zombie = FactoryGirl.create(:zombie)
 	 	visit zombie_url(zombie)

 	 	assert_equal zombie_path(zombie), current_path
 	 	
 	 	within("h1") do
 	 		assert has_content?(zombie.name)
 	 	end
 	end

 	test "Navigation is available to the zombie page" do
 		zombie = FactoryGirl.create(:tweeting_zombie)
 		assert zombie.tweets.count > 0, "Zombie does not have any tweets"
 		tweet=zombie.tweets.first
 		visit root_url
 		click_link zombie.name
 		assert_equal zombie_path(zombie), current_path
 	end

 	test "Should create a new zombie" do
 		visit root_url
 		fill_in "zombie_name", with: "Ash"
 		click_on "Create Zombie"
 		z=Zombie.find_by_name("Ash")
 		assert_equal zombie_path(z), current_path
 	end
end