class AuthenticationController < ApplicationController

  # POST auth/login
  def login
    auth = Authentication.new(login_params)
    if auth.authenticate
      render json: { token: auth.generate_token, uid: auth.user.id }, status: :ok
    else
      # render json: { error: "unauthorized" }, status: :unauthorized
      render json: "unauthorized", status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
