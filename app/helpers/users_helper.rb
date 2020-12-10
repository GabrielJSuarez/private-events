module UsersHelper
  def navbar_logged_in
    if logged_in?
      logout = link_to 'Log Out', logout_path, method: :delete, data: { confirm: 'Are you sure?' }, class: 'nav-link'
      content_tag(:li, logout, class: 'nav-item')
    else
      content_tag(:li, (link_to 'Log in', login_path, class: 'nav-link'), class: 'nav-link') +
        content_tag(:li, (link_to 'Sing up', new_user_path, class: 'nav-link'), class: 'nav-link')
    end
  end

  def user_name
    content_tag(:p, current_user.name.to_s, class: 'nav-link mb-0') if logged_in?
  end
end
