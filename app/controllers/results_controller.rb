class ResultsController < ApplicationController
  
  def new
  	@result = Result.new
  end

  def show
  end

  def create
  	@result = Result.new
  end
end
