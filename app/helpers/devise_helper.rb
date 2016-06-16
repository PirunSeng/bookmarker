module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    message = 'Please review the problem'

    content_tag(:div, class: 'hide', id: 'devise-alert') do
      message
    end
  end
end