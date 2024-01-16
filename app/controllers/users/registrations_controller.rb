class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionFix
  respond_to :json
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # def create
  #   build_resource(sign_up_params)

  #   if resource.save
  #     sign_up(resource_name, resource)
  #     render json: resource
  #   else
  #     render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end

  # def sign_up_params
  #   params.require(:user).permit(:username, :email, :password)
  # end
  private

  def respond_with(resource, _opts = {})
    if request.method == 'POST' && resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up sucessfully.' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    elsif request.method == 'DELETE'
      render json: {
        status: { code: 200, message: 'Account deleted successfully.' }
      }, status: :ok
    else
      render json: {
        status: { code: 422,
                  message: "User couldn't be created successfully.
        #{resource.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end
end
