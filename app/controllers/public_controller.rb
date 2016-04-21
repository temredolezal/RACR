class PublicController < ApplicationController

  layout 'public'

  before_action :setup_navigation

  def index
    # intro text
  end

  def show

    @section = Section.where(:permalink => params[:permalink], :visible => true).first
    if @section.nil?
      redirect_to(:action => 'index')
    else
      # display the page content using show.html.erb
    end

    #@sections = @page.sections.sorted

    @project = Project.visible

  end

  private

    def setup_navigation
      @projects = Project.visible.sorted
    end

end
