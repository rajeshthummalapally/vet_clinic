class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  def after_sign_in_path_for(resource)
    puts "resource #{resource.inspect}"
    return admin_users_path if resource.admin?

    path = if resource.doctor?
             pets_path
           elsif resource.receptionist?
             appointments_path
           elsif resource.admin?
             admin_users_path
           else
             appointments_path
           end
    return path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

end
