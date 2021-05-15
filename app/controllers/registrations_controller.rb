# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(sign_up_params)
    @user_serialized = NewUserSerializer.new @user
    if @user.save
      render json: @user_serialized
    else
      render json: { errors: @user.errors }
    end
  end

  private

  def sign_up_params
    params.permit(:first_name, :last_name, :email, :role, :password, :password_confirmation)
  end
end
