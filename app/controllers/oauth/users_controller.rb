class Oauth::UsersController < ApplicationController
  layout 'doorkeeper/admin'
  before_action :authenticate_admin!
  before_action :set_oauth_user, only: [:show, :edit, :update, :destroy]

  # GET /oauth/users
  def index
    @oauth_users = User.all
  end

  # GET /oauth/users/1
  def show
  end

  # GET /oauth/users/new
  def new
    @oauth_user = User.new
  end

  # GET /oauth/users/1/edit
  def edit
  end

  # POST /oauth/users
  def create
    @oauth_user = User.new(oauth_user_params)

    if @oauth_user.save
      redirect_to oauth_users_path, notice: "#{@oauth_user.email} was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /oauth/users/1
  def update
    if @oauth_user.update(oauth_user_params)
      redirect_to oauth_users_path, notice: "#{@oauth_user.email} was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /oauth/users/1
  def destroy
    @oauth_user.destroy
    redirect_to oauth_users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oauth_user
      @oauth_user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def oauth_user_params
      params.fetch(:user).permit(:email, :password, :password_confirmation)
    end
end
