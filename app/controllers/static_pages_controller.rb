class StaticPagesController < ApplicationController
  def home
        @projects = Project.find(:all, :order => "created_at DESC")
  end
end
