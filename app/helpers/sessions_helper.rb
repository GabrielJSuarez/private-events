module SessionsHelper
  def navbar_logged_in?
    return unless logged_in?

    id = 'navbarDropdown'
    bt_class = 'nav-link dropdown-toggle'
    data = { toggle: 'dropdown' }
    aria = { haspopup: 'true', expanded: 'false' }
    content_tag(:li, nil, class: 'nav-item dropdown') do
      content_tag(:a, 'Events', class: bt_class.to_s, href: '#', id: id.to_s, role: 'button', data: data, aria: aria) +
        content_tag(:div, nil, class: 'dropdown-menu', aria: { labelledby: 'navbarDropdown' }) do
          (link_to 'Create new event', new_event_path, class: 'dropdown-item') +
            (link_to 'View your events', user_path(current_user), class: 'dropdown-item') +
            content_tag(:div, nil, class: 'dropdown-divider') +
            (link_to 'View All Events', events_path, class: 'dropdown-item')
        end
    end
  end
end
