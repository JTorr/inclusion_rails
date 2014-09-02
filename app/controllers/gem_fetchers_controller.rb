class GemFetchersController < ApplicationController
  before_action :authenticate_user!
  def index
  end 
  
  def new
  end

  def create
    @gem_data = GemFetcher.fetch create_params
    @gem_model = RubyGem.new @gem_data["name"], @gem_data["info"]
    if @gem_model.save
      redirect_to gem_fetchers_path
    else
      render :new, flash: "You Suck"
    end
  end

  def create_params
    params.require(:ruby_gem)
  end
end
