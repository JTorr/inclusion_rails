class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites.all
  end
  
  def create
    @gem_model = RubyGem.find(params[:id])
    current_user.favorites.create! ruby_gem: @gem_model
    redirect_to gem_fetcher_path(@gem_model), notice: "Favorite Stored"
  end

  def destroy
    @gem_model = RubyGem.find(params[:id])
    @favorite = current_user.favorites.where(ruby_gem: @gem_model).first
    @favorite.destroy
    redirect_to gem_fetcher_path(@gem_model)
  end

end
