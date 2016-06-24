class TechtalksController < ApplicationController

  	before_filter :authorize, except: [:list]
  
	def index
		if (request.query_parameters.any?)
			filterByName
		else
			@techtalks = Techtalk.all
		end
	end

	def filterByName
		name = request.query_parameters['name']
		@techtalks = Techtalk.where(name: name).all
	end

	def filterByCompanyName
		company_name = request.query_parameters['company_name']
		@techtalks = Techtalk.where(company_name: company_name).all
	end

	def filterByDate
		begin_date = request.query_parameters['begin_date']
		@techtalks = Techtalk.where(date: begin_date).all
	end

	def list
		@techtalks = Techtalk.order('id desc').limit(10)
	end

end
