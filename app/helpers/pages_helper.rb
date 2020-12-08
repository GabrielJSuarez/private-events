module PagesHelper
  def home_buttons
    if logged_in?
      (link_to 'Log Out', logout_path, method: :delete, data: { confirm: 'Are you sure you want to log out' }, class: 'btn btn-danger')
    else
      (link_to 'Log in', login_path, class: 'btn btn-primary mr-3') +
        (link_to 'Sign Up', new_user_path, class: 'btn btn-success')
    end
  end
end
