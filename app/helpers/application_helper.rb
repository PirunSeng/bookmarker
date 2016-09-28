module ApplicationHelper
  def current_url(new_params)
    url_for params: params.merge(new_params)
  end
end
