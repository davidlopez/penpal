class ApplicationController < ActionController::Base
  helper_method :current_user, :resource_facade, :logged_in?, :survey_not_completed?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def resource_facade
    @resource_facade ||= ResourceFacade.new(current_user)
  end

  def logged_in?
    redirect_to root_path if !current_user
  end

  def survey_not_completed?
    redirect_to survey_path if current_user && !current_user.survey?
  end
end
