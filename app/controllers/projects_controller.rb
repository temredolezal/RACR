class ProjectsController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in

  def index
    @projects = Project.sorted
  end

  def show
    @project = Project.find(params[:id])
    #@section = Section.find(params[:id])
    #@pages = @section.pages.sorted
  end

  def new
    @project = Project.new({:name => "Default"})
    @project_count = Project.count + 1
  end

  def create
    # Instantiate a new object using form parameters
    @project = Project.new(project_params)
    # Save the object
    if @project.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Project created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      @project_count = Project.count + 1
      render('new')
    end
  end

  def edit
    @project = Project.find(params[:id])
    @project_count = Project.count
  end

  def update
    # Find an existing object using form parameters
    @project = Project.find(params[:id])
    # Update the object
    if @project.update_attributes(project_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Project updated successfully."
      redirect_to(:action => 'show', :id => @project.id)
    else
      # If update fails, redisplay the form so user can fix problems
      @project_count = Project.count
      render('edit')
    end
  end

  def delete
    @project = Project.find(params[:id])
  end

  def destroy
    project = Project.find(params[:id]).destroy
    flash[:notice] = "Project '#{project.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def project_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:project).permit(:name, :position, :visible, :created_at)
    end

end
