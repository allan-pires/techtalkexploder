class TechtalksController < ApplicationController

  	before_filter :authorize, except: [:list]
  
	def index
		if (request.query_parameters.any?)
			if request.query_parameters.include? 'keyword'
				filter
			elsif request.query_parameters.include? 'company_name'
				filterByCompanyName
			elsif request.query_parameters.include? 'begin_date'
				filterByDate
			end		
				
		else
			@techtalks = Techtalk.all
		end
	end

	def filterByCompanyName
		company_name = request.query_parameters['company_name']
		@techtalks = Techtalk.where(company_name: company_name).all
	end

	def filterByDate
		begin_date = request.query_parameters['begin_date']
		end_date = request.query_parameters['end_date']
		@techtalks = Techtalk.where(['created_at BETWEEN ? and ?', "#{begin_date}%", "#{end_date}%"]).all
	end

	def filter
		param = request.query_parameters['keyword']
		@techtalks = Techtalk.where(['tags LIKE ? OR name LIKE ? ', "%#{param}%", "%#{param}%"])
	end

end
