class Users::PasswordsController < Devise::PasswordsController
  include RackSessionFix
  # before_action :authenticate_user!, only: [:edit, :update]
  # before_action :load_resource, only: [:edit, :update]
  # before_action :set_minimum_password_length, only: [:new, :create]
  respond_to :json

  # def new
  #   head :no_content
  # end

  # def create; end
  #   @user = User.find_by(email: params[:email])
  #   if @user.send_password_reset_instructions
  #     @resource = build_resource(params)
  # if @resource.send_password_reset_instructions
  #   if resource_class.send_reset_password_instructions(resource_params)
  #     render json: { message: 'Password reset instructions sent successfully.' }, status: :ok
  #   else
  #     render json: @resource.errors, status: :unprocessable_entity
  #   end
  # end

  # def edit
  #   head :no_content
  # end

  # def update
  #   if @resource.errors.empty?
  #     @resource.update_attributes(params.permit(:password, :password_confirmation))
  #     if @resource.errors.empty?
  #       clear_reset_password_token
  #       render json: { message: 'Password updated successfully.' }, status: :ok
  #     else
  #       render json: @resource.errors, status: :unprocessable_entity
  #     end
  #   else
  #     render json: @resource.errors, status: :unprocessable_entity
  #   end
  # end

  private

  def respond_with(resource, _opts = {})
    @user = User.find_by(email: params[:email])
    if @user.send_reset_password_instructions
      render json: {
        status: { code: 200, message: 'Password reset instructions sent successfully.' },
        user: @user
      }, status: :ok
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  # def load_resource
  #   @resource = resource_class.find_by(reset_password_token: params[:reset_password_token])
  # end

  # def set_minimum_password_length
  #   @min_password_length = Devise.password_length
  # end

  # def clear_reset_password_token
  #   @resource.update_attributes(reset_password_token: nil)
  # end
end
