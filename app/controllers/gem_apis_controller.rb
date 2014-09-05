class GemApisController < ApplicationController
  before_action :authenticate_user!
  def show
    @gem_model = RubyGem.find params[:id]
  end 
  
  def new
    @gem_model = RubyGem.new
    if params[:ruby_gem]
      @gem_data = GemApi.search create_params
    end
  end

  def create
    @gem_model = RubyGem.new name: params[:name], info: params[:info]
    if @gem_model.save
      redirect_to :back, notice: "Gem Saved"
    else 
      @gem_model = RubyGem.find_by_name(params[:name])
      flash[:warning] = "Already exists"
      render :show 
    end
  end

  def create_params
    params.require(:ruby_gem)
  end
end
