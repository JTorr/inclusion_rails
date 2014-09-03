class GemFetchersController < ApplicationController
  before_action :authenticate_user!
  def index
    @ruby_gems = RubyGem.all
  end

  def new
    @gem_model = RubyGem.new
    if create_params
      @gem_data = GemFetcher.fetch create_params
    end
  end

  def create
    @gem_data = GemFetcher.fetch create_params

    # @gem_model = RubyGem.new name: @gem_data["name"], info: @gem_data["info"]
    # if @gem_model.save
    #   redirect_to gem_fetchers_path, notice: "Gem saved"
    # else
    #   render :new, flash: "You Suck"
    # end
  end

  def show
  end

  def create_params
    params.require(:ruby_gem)
  end
end
