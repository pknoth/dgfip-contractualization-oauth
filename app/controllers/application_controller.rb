class ApplicationController < ActionController::Base

  protected

  def after_destroy_user_session_path_for(_resource)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    return signed_in_root_path(resource_or_scope) unless session['authorize_url']

    uri = URI.parse(session['authorize_url'])
    uri.query = [uri.query, 'from_devise=true'].join('&')

    uri.to_s
  end
end
