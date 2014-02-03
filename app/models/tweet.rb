class Tweet < ActiveRecord::Base
	belongs_to :zombie
	validates :zombie, presence: true
end
