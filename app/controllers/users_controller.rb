class UsersController < ApplicationController
  before_action :authorize_request, except: [:create]

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
    if @current_user.destroy
      head :no_content, status: :ok
    else
      render json: @current_user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
