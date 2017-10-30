class ApplicationController < ActionController::Base

  protected

  def authenticate_admin!
    authenticate_or_request_with_http_basic do |username, password|
      username == "foo" && password == "bar"
    end
  end

  def after_destroy_user_session_path_for(_resource)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    return signed_in_root_path(resource_or_scope) unless session['authorize_url']
    session['from_devise'] = true
    session['authorize_url']
  end
end
