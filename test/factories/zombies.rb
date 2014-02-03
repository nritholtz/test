FactoryGirl.define do 
	factory :zombie do
		sequence(:name){|i| "Max#{i}"}
  		bio "Hey Guys!"
  		age  23
  		email "test@example.com"

  		factory :tweeting_zombie do
  			ignore do
  				tweets_count 5
  			end

  			after(:create) do |zombie, evaluator|
  				create_list(:tweet, evaluator.tweets_count, zombie: zombie)
  			end
  		end
  	end
end