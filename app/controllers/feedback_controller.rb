class FeedbackController < ApplicationController
  before_action :logged_in?, :survey_not_completed?

  def create; end
end
