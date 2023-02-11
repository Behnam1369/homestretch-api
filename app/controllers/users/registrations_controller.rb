module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
      build_resource(sign_up_params)

      if User.exists?(email: resource.email)
        return render json: { success: false, error: 'Email has already been taken' }
      end

      resource.save
      return render json: { success: false, error: resource.errors.full_messages } unless resource.persisted?

      render json: { success: true, data: resource }
    end

    private

    def respond_with(resource, _opts = {})
      resource.persisted? ? register_success : register_failed
    end

    def register_success
      render json: { message: 'Signed up.' }
    end

    def register_failed
      render json: { message: 'Signed up failure.' }
    end
  end
end
