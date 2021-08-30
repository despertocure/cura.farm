# frozen_string_literal: true

module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map do |msg|
      "<li><i class='fa fa-exclamation-triangle mr4'></i> #{msg}</li>"
    end.join

    "<ul class='list bg-red pv3 white br2'>#{messages}</ul>".html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

  def form_container_classes
    'mw6 mw7-ns center pa4-l'
  end
end
