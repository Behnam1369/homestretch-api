module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    # def create
    #   if user_signed_in?
    #     render json: { message: 'Signed in successfully.', role: current_user.role }, status: :ok
    #   else
    #     render json: { message: 'Wrong credentials. Please try again.' }, status: :unauthorized
    #   end
    # end

    def create
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
      render json: { success: true, data: resource }
    rescue ActiveRecord::RecordNotFound, Devise::InvalidPassword => e
      render json: { success: false, error: "Invalid email or password" }
    end

    private

    def respond_with(resource, _opts = {})
      if resource.persisted?
        render json: {
          status: { code: 200, message: 'Logged' },
          data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
        }
      else
        render json: {
          status: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
        }, status: :unprocessable_entity
      end
    end

    def respond_to_on_destroy
      current_user ? log_out_success : log_out_failure
    end

    def log_out_success
      render json: { message: 'Logged out.' }, status: :ok
    end

    def log_out_failure
      render json: { message: 'Logged out failure.' }, status: :unauthorized
    end
  end
end
