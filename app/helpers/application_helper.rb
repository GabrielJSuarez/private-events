module ApplicationHelper
  def error_messages
    flash.each do |name, msg|
      concat(
        content_tag(:div, nil, class: "alert alert-#{name} alert-dismissible fade show", role: 'alert') do
          content_tag(:strong, msg.to_s) +
            content_tag(:button, nil, class: 'close', data: { dismiss: 'alert' }, aria: { label: 'Close' }) do
              content_tag(:span, '&times;'.html_safe, aria: { hidden: 'true' })
            end
        end
      )
    end
  end

  def specific_error_messages(obj)
    return unless obj.errors.any?

    content_tag(:div, nil, class: 'card text-white bg-danger mb-3 w-25 mx-auto') do
      content_tag(:h2, "#{pluralize(obj.errors.count, 'error')}, article didn't save:", class: 'card-header') +
        content_tag(:div, nil, class: 'card-body') do
          obj.errors.full_messages.each do |msg|
            concat(
              content_tag(:ul, nil, class: 'list-group list-unstyled') do
                content_tag(:li, msg.to_s, class: 'ist-group-item')
              end
            )
          end
        end
    end
  end
end
