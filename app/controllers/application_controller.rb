class ApplicationController < ActionController::Base

  rescue_from Doorkeeper::ShouldChooseUser do
    store_location_for(:user, request.url)
    redirect_to(session_choose_path)
  end

  protected

  def authenticate_admin!
    authenticate_or_request_with_http_basic do |username, password|
      username == "foo" && password == "bar"
    end
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end
end
