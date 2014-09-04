class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @gem_model = RubyGem.find_by_name(params[:name])
    @favorites = current_user.favorites
  end

  def create
    @gem_model = RubyGem.find(params[:id])
    current_user.favorites.create! ruby_gem: @gem_model
    redirect_to :back, notice: "Favorite stored"
  end

  def destroy
    @gem_model = RubyGem.find params[:id]
    @favorite = current_user.favorites.where(ruby_gem: @gem_model).first
    @favorite.delete
    redirect_to :back, notice: "Favorite removed"
  end
end
