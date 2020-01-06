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
      feeling_params.values.each do |feel|
        current_user.feeling_preferences.create(feeling: feel)
      end
    end

    def create_music_preferences
      music_params.values.each do |gen|
        if gen != ''
          current_user.music_preferences.create(genre: gen)
        end
      end
    end

    def create_activity_preferences
      activity_params.values.each do |activity|
        if activity != ''
          current_user.activity_preferences.create(description: activity)
        end
      end
      resource_params.values.each do |resource|
        current_user.activity_preferences.create(description: resource)
      end
    end

    def create_time_preferences
      time = TimePreference.create(user_id: current_user.id)
      time_params.values.each do |pref|
        time.update_attribute(pref, true)
      end
    end

    def create_media_preferences
      media_preference = MediaPreference.create(user_id: current_user.id)
      media_params.values.each do |media|
        media_preference.update_attribute(media, true)
      end
    end

    def music_params
      params.require(:user).require(:music_preferences)
    end

    def feeling_params
      binding.pry
      params.require(:user).require(:feeling_preferences)
    end

    def activity_params
      params.require(:user).require(:activity_preferences)
    end

    def time_params
      params.require(:user).require(:time_preference)
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
