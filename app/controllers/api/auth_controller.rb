class Api::AuthController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user!, only: :login
  skip_before_action :verify_authenticity_token, only: :login
  include ActiveStorage::SetCurrent
  def login
    user = User.find_by(email: params[:email], active: true)

    if user && user.valid_password?(params[:password])
      # Tạo token và trả về cho người dùng
      token = encode_token(user.id)
      render json: {
        data: {
          client: ActiveModelSerializers::SerializableResource.new(user, each_serializer: Api::ClientSerializer),
          token: token
        },
        status: 1
      }, status: :ok
    else
      render json: { error: 'Email hoặc mật khẩu không đúng' }, status: :unauthorized
    end
  end

  private

  def encode_token(user_id)
    payload = { user_id: user_id }
    JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
  end
end
