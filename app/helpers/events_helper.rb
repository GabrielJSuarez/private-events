module EventsHelper
  def show_events(events, date)
    events.each do |event|
      concat(
        event_helper(event, date)
      )
    end
  end

  def show_single_event(event)
    date = if event.event_date >= Time.now
             'success'
           else
             'danger'
           end
    event_helper(event, date)
  end

  def assist_event?(event)
    return unless Time.now && !event.attendees.exists?(current_user.id)

    link_to 'Assist to this event', new_attendance_path, class: 'btn btn-success' if current_user != event.creator
  end

  private

  def event_helper(event, date)
    content_tag(:div, nil, class: "card my-4 border-#{date}") do
      content_tag(:div, "#{event.creator.name}'s Event", class: 'card-header font-weight-bold') +
        content_tag(:div, nil, class: "card-body text-#{date}") do
          content_tag(:h5, event.event_name.to_s, class: 'card-title') +
            content_tag(:p, event.description.to_s, class: 'card-text') +
            if event.event_date >= Time.now
              content_tag(:p, "Event will be in #{time_ago_in_words(event.event_date)}", class: 'card-text')
            else
              content_tag(:p, "Event was #{time_ago_in_words(event.event_date)} ago", class: 'card-text')
            end
        end +
        content_tag(:div, "Created #{time_ago_in_words(event.created_at)} ago", class: 'card-footer text-muted') +
        (link_to 'View event details', event_path(event), class: "btn btn-#{date}")
    end
  end
end
