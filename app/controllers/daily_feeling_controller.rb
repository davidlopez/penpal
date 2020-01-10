class DailyFeelingController < ApplicationController
  def create
    daily_feeling = current_user.daily_feelings.create(feeling_param)
    if daily_feeling.save
      redirect_to '/boost'
    else
      redirect_to '/landing'
    end
  end

  private

    def feeling_param
      params.require(:daily_feeling).permit(:feeling)
    end
end
