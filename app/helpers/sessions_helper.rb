module SessionsHelper
  def navbar_logged_in?
    return unless logged_in?

    content_tag(:li, nil, class: 'nav-item dropdown') do
      content_tag(:a, 'Events', class: 'nav-link dropdown-toggle', href: '#', id: 'navbarDropdown', role: 'button', data: { toggle: 'dropdown' }, aria: { haspopup: 'true', expanded: 'false' }) +
        content_tag(:div, nil, class: 'dropdown-menu', aria: { labelledby: 'navbarDropdown' }) do
          (link_to 'Create new event', new_event_path, class: 'dropdown-item') +
            (link_to 'View your events', user_path(current_user), class: 'dropdown-item') +
            content_tag(:div, nil, class: 'dropdown-divider') +
            (link_to 'View All Events', events_path, class: 'dropdown-item')
        end
    end
  end
end
