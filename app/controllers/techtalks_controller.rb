class TechtalksController < ApplicationController
	def new

	end

	def list
		@techtalks = Techtalk.all
	end

	def listByCompany

	end

	def listByDate
	end
end
