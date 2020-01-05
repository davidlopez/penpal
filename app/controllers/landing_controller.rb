class LandingController < ApplicationController
  before_action :logged_in?, :survey_not_completed?
  def index; end
end
