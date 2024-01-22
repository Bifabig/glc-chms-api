class Users::PasswordsController < Devise::PasswordsController
  include RackSessionFix
  # before_action :authenticate_user!, only: [:edit, :update]
  # before_action :load_resource, only: [:edit, :update]
  # before_action :set_minimum_password_length, only: [:new, :create]
  respond_to :json
  # before_action :validate_send_params, only: :create

  # def new
  #   super
  # end

  def create
    @user = User.find_by(email: params[:email])
    if @user.send_reset_password_instructions
      render json: {
        status: { code: 200, message: 'Password reset instructions sent successfully.' },
        user: @user
      }, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

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
  def update
    token = Devise.token_generator.digest(User, :reset_password_token, params[:reset_password_token])
    @user = User.find_by(reset_password_token: token)
    if @user.present?
      if @user.reset_password(params[:password], params[:password_confirmation])
        render json: {
          status: { code: 200, message: 'Your password is reset. You can now login' },
        }, status: :ok
      else
        render json: {
        status: { code: 422,
                  message: "password is reset failed.
        #{@user.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
      end
    else
      render json: {
        errors: 'Link not valid or expired. Try generating a new link.'
      }, status: :unprocessable_entity
    end
  end

  # private

  # def respond_with(resource, _opts = {})
  #   @user = User.find_by(email: params[:email])
  #   if @user.send_reset_password_instructions
  #     render json: {
  #       status: { code: 200, message: 'Password reset instructions sent successfully.' },
  #       user: @user
  #     }, status: :ok
  #   else
  #     render json: resource.errors, status: :unprocessable_entity
  #   end
  # end

  # def validate_send_params
  #   unless params[:email].present?
  #     render json: { status: { code: 400, message: 'Email is required.' } }, status: :bad_request
  #     return false
  #   end
  # end

  # def send_reset_password_instructions
  #   render json: { status: { code: 200, message: 'Password reset instructions sent successfully.' } }, status: :ok
  # end

  # def respond_with(resource, _opts = {})
  #   if resource.send_password_reset_instructions
  #     render json: {
  #       status: { code: 200, message: 'Password reset instructions sent successfully.' },
  #     }, status: :ok
  #   else
  #     render json: {
  #       status: { code: 401,
  #                 message: "Password reset instructions couldn't be sent.
  #       #{resource.errors.full_messages.to_sentence}" }
  #     }, status: :unprocessable_entity
  #   end
  # end

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
