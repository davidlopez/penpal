class SurveyController < ApplicationController
  before_action :completed?, :logged_in?
  def index
    @user = current_user
  end

  def create
    create_feelings; create_music_preferences; create_activity_preferences
    create_time_preferences; create_media_preferences
    current_user.update(survey?: true)
    flash[:success] = 'Preferences saved'
    redirect_to '/landing'
  end

  private

    def create_feelings
      feeling_params.each do |feel|
        current_user.feeling_preferences.create(feeling: feel)
      end
    end

    def create_music_preferences
      music_params.each do |gen|
        current_user.music_preferences.create(genre: gen)
      end
      custom_music_params.values.each do |gen|
        if gen != ''
          current_user.music_preferences.create(genre: gen)
        end
      end
    end

    def create_activity_preferences
      activity_params.each do |activity|
        current_user.activity_preferences.create(description: activity)
      end
      custom_activity_params.values.each do |act|
        if act != ''
          current_user.activity_preferences.create(description: act)
        end
      end
    end

    def create_time_preferences
      time = TimePreference.create(user_id: current_user.id)
      time_params.each do |pref|
        time.update_attribute(pref, true)
      end
    end

    def create_media_preferences
      media_preference = MediaPreference.create(user_id: current_user.id)
      media_params.each do |media|
        media_preference.update_attribute(media, true)
      end
    end

    def music_params
      params.require(:user).require(:music_preferences)
    end

    def feeling_params
      params.require(:user).require(:feeling_preferences)
    end

    def activity_params
      params.require(:user).require(:activity_preferences)
    end

    def time_params
      params.require(:user).require(:time_preference)
    end

    def custom_music_params
      params.permit(:music_1, :music_2)
    end

    def custom_activity_params
      params.permit(:activity_1, :activity_2, :activity_3)
    end

    def media_params
      params.require(:user).require(:media_preference)
    end

    def completed?
      if current_user
        redirect_to landing_path if current_user.survey?
      end
    end
end
