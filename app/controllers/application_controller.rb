class ApplicationController < ActionController::API
  include ExceptionHandler

  def not_found
    render json: { error: 'not_found' } 
  end

  def authorize_request
    token = Authorization.new(request)
    @current_user = User.find(token.current_user)
  rescue ActiveRecord::RecordNotFound => e
    render json: { errors: e.message }, status: :unauthorized
  rescue JWT::DecodeError => e
    render json: { errors: e.message }, status: :unauthorized
  end
end