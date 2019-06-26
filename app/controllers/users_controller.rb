class UsersController < ApplicationController
  before_action :authorize_request, except: [:login, :create]

  # POST /login
  def login
    auth = Authentication.new(login_params)
    if auth.authenticate
      render json: { token: auth.generate_token, uid: auth.user.id }, status: :ok
    else
      render json: { error: "unauthorized" }, status: :unauthorized
    end
  end

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # POST /users
  def create  
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /users/:id
  def show
    render json: @current_user, status: :ok
  end

  # DELETE /users/:id
  def destroy
    @current_user.destroy
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
