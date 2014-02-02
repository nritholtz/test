class Zombie < ActiveRecord::Base
	has_many :tweets, dependent: :destroy
	after_save :name_change_notification, if :name_changed?

	def as_json(options = nil)
		super(options || {include: :tweets, except: [:id,:created_at,:updated_at]})
	end
	private

		def name_change_notification
		ZombieMailer.name_change(self).deliver
		end
	end
end
