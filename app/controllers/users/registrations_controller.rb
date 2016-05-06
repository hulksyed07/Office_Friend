class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
after_action :create_person_after_user_reg, only: [:create]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   # devise_parameter_sanitizer.permit(:sign_up)#, keys: [:attribute])
  #   # params.require(:user).permit(:email, :password, :person_attributes)

  #   devise_parameter_sanitizer.for(:sign_up) {|u|
  #    u.permit(:email, :password, :password_confirmation, :remember_me,
  #    person_attributes: [:first_name, :last_name])}
  #   # params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :person_attributes [:first_name, :last_name] )
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private
  def create_person_after_user_reg
    puts '--------------------------------'
    puts Person.create(:user_id => current_user.id)
  end
end
