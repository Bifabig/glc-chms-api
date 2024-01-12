class Users::SessionsController < Devise::SessionsController
  include RackSessionFix
  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]

  # This specifies that this controller should respond to JSON requests. This means that
  # when a client makes a request to this controller's actions, the response will be in
  # JSON format, which is typical for API endpoints.

  # def destroy
  #   # Sign out the user
  #   sign_out(current_user) if user_signed_in?

  #   render json: { message: 'User signed out successfully' }
  # end

  # def create
  #   username = params[:user][:username] # It extracts the username from the request parameters.
  #   user = User.find_by(username:) # find a user by the provided username.

  #   if user&.valid_password?(params[:user][:password])
  #     sign_in(user)
  #     render json: { user:, message: 'Sign in successfuly' }
  #   else
  #     render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
  #   end
  # end

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: {code: 200, message: 'Logged in sucessfully.'},
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: "logged out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
