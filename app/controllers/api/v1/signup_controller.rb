class Api::V1::SignupController < ApplicationController
  def create
    @user = User.new(signup_params)

    if @user.save
      render json: auth_token, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter " white list" through.
    def signup_params
      params.permit(:email, :password)
    end

    def auth_token
      if @user.respond_to? :to_token_payload
        Knock::AuthToken.new payload: @user.to_token_payload
      else
        Knock::AuthToken.new payload: { sub: @user.id }
      end
    end
end
