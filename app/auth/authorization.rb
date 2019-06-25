class Authorization
  def initialize(request)
    @token = request.headers['Authorization']
    # TODO
    # PARSE TOKEN FROM Authorization HEADER
  end

  def current_user
    JsonWebToken.decode(@token)[:user_id]
  end
end