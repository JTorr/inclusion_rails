class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.where(title: [:title]).first
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new title: params[:title]
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
