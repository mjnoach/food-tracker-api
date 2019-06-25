class Authentication
  def initialize(login_params)
    @email = login_params[:email]
    @password = login_params[:password]
    @user = User.find_by(email: @email)
  end

  def authenticate
    @user && @user.authenticate(@password)
  end

  def generate_token
    JsonWebToken.encode(user_id: @user.id)
  end
end