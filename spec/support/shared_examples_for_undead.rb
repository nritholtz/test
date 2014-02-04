shared_examples_for 'the undead' do |undead|
	it 'also is rotting' do
		undead.rotting.should == true
	end
end