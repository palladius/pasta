class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :authenticate_user!

  # https://stackoverflow.com/questions/4187985/display-page-load-time-in-rails-3
  before_action :set_start_time
  def set_start_time
    @start_time = Time.now.to_f
  end

  protected

  # https://stackoverflow.com/questions/37341967/rails-5-undefined-method-for-for-devise-on-line-devise-parameter-sanitizer
    def configure_permitted_parameters
      #devise_parameter_sanitizer.for(:sign_up).push(:name, :surname, :username, :email, :avatar)
      #devise_parameter_sanitizer.for(:account_update).push(:name, :surname, :email, :avatar)
      #devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :firstname, :middlename, :lastname, :nickname) }
      #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :firstname, :middlename, :lastname, :nickname) }
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :likes, :dislikes])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :likes, :dislikes])

    end

end
