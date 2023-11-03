class Api::V1::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  respond_to :json
  # This specifies that this controller should respond to JSON requests. This means that
  # when a client makes a request to this controller's actions, the response will be in
  # JSON format, which is typical for API endpoints.

  def destroy
    # Sign out the user
    sign_out(current_user) if user_signed_in?

    render json: { message: 'User signed out successfully' }
  end

  def create
    username = params[:user][:username] # It extracts the username from the request parameters.
    user = User.find_by(username:) # find a user by the provided username.

    if user&.valid_password?(params[:user][:password])
      sign_in(user)
      render json: { user:, message: 'Sign in successfuly' }
    else
      render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
    end
  end
end
