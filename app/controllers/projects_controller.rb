class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @projects = Project.all
  end

  def show
    # @project = Project.find params[:title]
    @project = Project.where(title: params[:title])#.first
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(title: params[:title])
    @project.parse(params[:gemfile])
    @project.attach_gems
    # @project.user_id = current_user.id

    if @project.save
      redirect_to projects_show_path(@project), notice: "Project Stored"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @project = current_user.find(params[:title])
    #@project = current_user.projects.where(ruby_gem: @gem_model).first
    @project.destroy
    redirect_to projects_show_path(@project)
  end
end
