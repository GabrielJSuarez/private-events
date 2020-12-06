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
end

