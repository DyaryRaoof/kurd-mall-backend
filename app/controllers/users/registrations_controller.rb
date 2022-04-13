class Users::RegistrationsController < Devise::RegistrationsController
  # respond_to :json

  def new
    respond_to do |format|
      format.html { @user = User.new }
      format.json
    end
  end

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    respond_to do |format|
      format.html do
        redirect_to root_url,
                    notice: 'User was successfully created.'
      end
      format.json { render json: { message: 'Signed up sucessfully.' }, status: :ok }
    end
  end

  def register_failed
    respond_to do |format|
      format.html do
        render :new, notice: resource.errors, status: :unprocessable_entity
      end
      format.json { render json: resource.errors, status: :unprocessable_entity }
    end
  end
end
