class GemFetchersController < ApplicationController
  before_action :authenticate_user!
  def show
    @gem_model = RubyGem.find params[:id]
  end 
  
  def new
    @gem_model = RubyGem.new
    if params[:ruby_gem]
      @gem_data = GemFetcher.fetch create_params
    end
  end

  def create
    @gem_model = RubyGem.new name: params["name"], info: params["info"]
    if @gem_model.save
      redirect_to gem_fetcher_path(@gem_model), notice: "Gem Saved"
    else
      render :new, flash: "Please try again"
    end
  end

  def create_params
    params.require(:ruby_gem)
  end
end
