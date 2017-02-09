module ApplicationHelper
  def current_url(new_params)
    url_for params: params.merge(new_params)
  end

  def manageable?(object)
    current_user.id == object.user_id || current_user.admin?
  end
end
