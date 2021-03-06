class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,  only: [:edit, :update]
  before_action :admin_user,    only: :destroy

  def new
  	@user = User.new
  end

  def index
  	@users = User.all
  end

	def show
		@user = User.find(params[:id])
	end

  def edit
    
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
      flash[:success] = "Profile updated"
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "User successfully created"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private
	
  def user_params
  	params.require(:user).permit(:name, :email, :password, 
  													 :password_confirmation)
  end

  def signed_in_user
      unless signed_in?
      store_location
      redirect_to signin_url
      flash[:warning] = "Please sign in."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(contents_path) unless current_user?(@user)
  end

  def admin_user
      edirect_to (root_url) unless current_user.admin?
  end
end