class UsersController < ApplicationController
    before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
    before_filter :correct_user,   only: [:edit, :update]
    before_filter :admin_user,     only: :destroy
    before_filter :block_signup_for_signed_in_users, only: [:new, :create]

    def index
        @users = User.paginate(page: params[:page], :per_page => 30).order("name")
    end

    def show
        @user = User.find(params[:id])
        if signed_in?
            @feed_projects = current_user.projects_feed.paginate(page: params[:page]).order("created_at DESC")
        end
    end

    def new
        @user = User.new
    end

    def edit
    end

    def create
        @user = User.new(params[:user])

        if @user.save
            flash[:success] = 'Sign up succeeded. Welcome to Crowd Impact!'
            sign_in @user
            redirect_to @user
        else
            render "new"
        end
    end

  def update
      if @user.update_attributes(params[:user])
          flash[:notice] = 'Profile was successfully updated.'
          sign_in @user
          redirect_to @user
      else
          render 'edit'
      end
  end


  # DELETE /users/1
  # DELETE /users/1.json
    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted."
        redirect_to users_url
    end

    private

        def correct_user
            @user = User.find(params[:id])
            redirect_to(root_path) unless current_user?(@user)
        end

        def admin_user
            redirect_to(root_path) unless current_user.admin?
        end

        def block_signup_for_signed_in_users
            if signed_in?
                flash[:notice] = "Please log out before signing up a new user."
                redirect_to(root_path)
            end
        end
end
