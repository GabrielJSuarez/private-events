module EventsHelper
  def show_events(events)
    events.each do |event|
      concat(
        content_tag(:div, nil, class: 'card my-4') do
          content_tag(:div, "#{event.creator.name}'s Event", class: 'card-header') +
            content_tag(:div, nil, class: 'card-body') do
              content_tag(:h5, event.event_name.to_s, class: 'card-title') +
                content_tag(:p, event.description.to_s, class: 'card-text') +
                content_tag(:p, event.event_date.to_s, class: 'card-text')
            end +
            content_tag(:div, "#{time_ago_in_words(event.created_at)} ago", class: 'card-footer text-muted') +
            (link_to 'View event details', event_path(event), class: 'btn btn-primary')
        end
      )
    end
  end
end
