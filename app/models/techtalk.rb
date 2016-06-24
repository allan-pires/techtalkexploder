class Techtalk < ActiveRecord::Base

	default_scope { where(created_at: 1.month.ago .. Time.now).order(created_at: :desc) }
	validates_presence_of :title, :description, :company_name, :company_email

	before_save :generate_token

  	def tagsArray
		self.tags.split(',')
	end

	private
	    def generate_token
	    	self.token = SecureRandom.urlsafe_base64 if self.token.nil?
	    end 
end
