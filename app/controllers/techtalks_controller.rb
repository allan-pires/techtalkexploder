class TechtalksController < ApplicationController

	def index
		@techtalks = Techtalk.all
	end

	def new

	end
end
