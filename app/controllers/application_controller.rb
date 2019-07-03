class ApplicationController < ActionController::API
  include ExceptionHandler

  def not_found
    render json: { error: 'not_found' } 
  end

  def authorize_request
    token = Authorization.new(request)
    @current_user = User.find(token.current_user)
  rescue ActiveRecord::RecordNotFound, ExceptionHandler::ExpiredSignature, JWT::DecodeError => e
    render json: { object: e.inspect, errors: e.message }, status: :unauthorized
  end
end