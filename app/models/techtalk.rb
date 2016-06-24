class Techtalk < ActiveRecord::Base

	def tagsArray
		self.tags.split(',')
	end
end
