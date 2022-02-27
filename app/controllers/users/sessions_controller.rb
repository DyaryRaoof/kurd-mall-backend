class Users::SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token

    # respond_to :json

    def new
        respond_to do |format|
          format.html { @user = User.new }
        end
    end

    private
  
    def respond_with(resource, _opts = {})
      respond_to do |format|
          format.html do
            redirect_to root_url,
                        notice: 'User was successfully Signed in.'
          end
          format.json { render json: { message: 'You are logged in.'}, status: :ok}
      end
    end
  
    def respond_to_on_destroy
      log_out_success && return if current_user
  
      log_out_failure
    end
  
    def log_out_success
      respond_to do |format|
        format.html do
          redirect_to after_sign_out_path_for(resource),
                      notice: 'User was successfully Signed out.'
        end
        format.json { render json: { message: 'You are logged out.'}, status: :ok}
      end
    end
  
    def log_out_failure
      render json: { message: "Hmm nothing happened."}, status: :unauthorized
    end
  end