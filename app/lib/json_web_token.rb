class JsonWebToken
  JWT_SECRET = Rails.application.secrets.secret_key_base

  # def self.encode(payload, exp = 24.hours.from_now)
  def self.encode(payload, exp = 5.seconds.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, JWT_SECRET)
  end

  def self.decode(token)
    decoded = JWT.decode(token, JWT_SECRET)[0]
    HashWithIndifferentAccess.new decoded
  rescue JWT::ExpiredSignature, JWT::VerificationError => e
    raise ExceptionHandler::ExpiredSignature, e.message
  rescue JWT::DecodeError, JWT::VerificationError => e
    raise ExceptionHandler::DecodeError, e.message
  end
end