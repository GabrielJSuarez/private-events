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

  def user_created_events(user)
    user.created_events.each do |event|
      helper_view(event)
    end
  end

  def user_attended_events(user)
    user.attended_events.each do |event|
      helper_view(event)
    end
  end

  private

  def helper_view(event)
    concat(
      content_tag(:div, nil, class: 'card my-4') do
        content_tag(:div, time_ago_in_words(event.event_date).to_s, class: 'card-header') +
          content_tag(:div, nil, class: 'card-body') do
            content_tag(:h5, event.event_name.to_s, class: 'card-title') +
              content_tag(:p, event.description.to_s, class: 'card-text')
          end +
          content_tag(:div, "#{time_ago_in_words(event.created_at)} ago", class: 'card-footer text-muted') +
          (link_to 'View Event', event_path(event), class: 'btn btn-primary')
      end
    )
  end
end
