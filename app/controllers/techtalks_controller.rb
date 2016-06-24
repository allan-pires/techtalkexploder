class TechtalksController < ApplicationController

  before_filter :authorize, except: [:list]

  def index
    @techtalks = Techtalk.all
    @techtalks = Techtalk.order('id desc').limit(10)
  end

  def new
    @techtalk = Techtalk.new
  end

  def create
    @techtalk = Techtalk.new(techtalk_params)
    respond_to do |format|
      if @techtalk.save
        format.html { render :index, notice: 'Techtalk was successfully created.' }
        format.json { render :index, status: :created, location: @techtalk }
      else
        format.html { render :new }
        format.json { render json: @techtalk.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def techtalk_params
      params.require(:techtalk).permit(:title, :description, :type, :company_name, :url, :company_email, :token)
    end
end
