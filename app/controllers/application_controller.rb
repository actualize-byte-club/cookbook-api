class ApplicationController < ActionController::API
  # current_user will return either nil (if token is expired or is Authorization header is not present/wrong), or will return the hash of User data based on id
  def current_user
    auth_headers = request.headers["Authorization"]
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: "HS256" }
        )
        User.find(decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end
end