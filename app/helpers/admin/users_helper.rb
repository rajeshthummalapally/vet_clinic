module Admin::UsersHelper
  def user_roles
    User::ROLES.map{|role| [role.capitalize, role]}
  end

  def user_form_submission_path
    @user.persisted? ? admin_user_path(@user) : admin_users_path
  end
end
