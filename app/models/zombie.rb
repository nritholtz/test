class Zombie < ActiveRecord::Base
	has_many :tweets, dependent: :destroy
	validates :name, presence: true
	#after_save :name_change_notification, if :name_changed?

	def avatar_url
		"http://zombitar.com/#{id}.jpg"
	end
	
	def as_json(options = nil)
		super(options || {include: :tweets, except: [:id,:created_at,:updated_at]})
	end
	#private

	#	def name_change_notification
	#	ZombieMailer.name_change(self).deliver
	#	end
	#end
end
