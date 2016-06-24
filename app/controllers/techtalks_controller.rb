class TechtalksController < ApplicationController

  before_filter :authorize, except: [:list]
  
	def index
		@techtalks = Techtalk.all
	end

  def new
  end

  def list
    @techtalks = Techtalk.order('id desc').limit(10)
  end
end
