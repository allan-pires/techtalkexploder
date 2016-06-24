class TechtalksController < ApplicationController

  	before_filter :authorize, except: [:list]
  
	def index
		if (request.query_parameters.any?)
			if request.query_parameters.include? 'name'
				filterByName
			elsif request.query_parameters.include? 'company_name'
				filterByCompanyName
			elsif request.query_parameters.include? 'begin_date'
				filterByDate
			elsif request.query_parameters.include? 'tag'
				filterByTag
			end		
				
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
		end_date = request.query_parameters['end_date']
		@techtalks = Techtalk.where(['date >= ? and date <= ?', "%#{created_at}%", "%#{updated_at}%"]).all
	end

	def filterByTag
		begin_date = request.query_parameters['tag']
		@techtalks = Techtalk.where(['tags LIKE ?', "%#{begin_date}%"])
	end

end
