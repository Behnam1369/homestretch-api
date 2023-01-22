class UsersController < ApplicationController
  def show_profile
    render json: current_user
  end

  def save_profile
    if current_user.update(profile_params)
      render json: { message: 'Success' }
    else
      render json: { message: 'Error', errors: current_user.errors }
    end
  end

  def profile_params
    params.require(:user).permit(
      :fname, :lname, :phone, :birth_date, :veteran_status,
      :home_buying_status, :race, :address1, :address2, :city, :zipcode,
      :employment_status, :income, :debt_to_income, :credit_score,
      :when, :house_type, :budget, :where,
      :avatar, :inactive
    )
  end
end
