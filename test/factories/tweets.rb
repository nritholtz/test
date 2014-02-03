FactoryGirl.define do
	factory :tweet do
		message 'Hey guys!!'
		association :zombie
	end
end