class TechtalksController < ApplicationController
	def new

	end

	def list
		@techtalks = Techtalk.all
	end
end
