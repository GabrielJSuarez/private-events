module PagesHelper
  def home_buttons
    if logged_in?
      bt_class = 'btn btn-danger'
      bt_confirm = 'Are you sure you want to log out'
      (link_to 'Log Out', logout_path, method: :delete, data: { confirm: bt_confirm.to_s }, class: bt_class.to_s)
    else
      (link_to 'Log in', login_path, class: 'btn btn-primary mr-3') +
        (link_to 'Sign Up', new_user_path, class: 'btn btn-success')
    end
  end
end
