class LandingController < ApplicationController
  before_action :logged_in?, :survey_not_completed?
  def index
    @daily_feeling = current_user.daily_feelings.new
  end
end
