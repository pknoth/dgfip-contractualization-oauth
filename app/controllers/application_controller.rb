class ApplicationController < ActionController::Base

  rescue_from Doorkeeper::ShouldChooseUser do
    session['authorize_url'] = request.url
    redirect_to(session_choose_path)
  end

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
