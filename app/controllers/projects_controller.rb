class ProjectsController < ApplicationController
    before_filter :signed_in_user, only: [:new, :create]

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def create
        @project = current_user.projects.build(params[:project])
        if @project.save
            flash[:success] = "New Impact created."
            redirect_to root_path
        else
            render 'new'
        end
    end

end