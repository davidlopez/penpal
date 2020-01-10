class SurveyController < ApplicationController
  before_action :completed?, :logged_in?

  def index; end

  def create
    if all_resources_checked?
      create_resource_preferences
      create_music_preferences
      create_media_preferences
      create_activity_preferences
      create_feelings
      create_time_preferences
      current_user.update(survey?: true)
      flash[:success] = 'Preferences saved'

      redirect_to '/landing'
    else
      flash[:error] = 'Please select preferences for each category'
      redirect_to survey_path
    end
  end

  private

    def all_resources_checked?
      !params.require(:activity).permit!.to_h.all? { |k,v| v == '' } &&
      !params.require(:music).permit!.to_h.all? { |k,v| v == '' } &&
      params.keys.include?('media') &&
      params.keys.include?('feelings') &&
      params.keys.include?('time') &&
      params.keys.include?('resources')
    end

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
    end

    def create_resource_preferences
      resource_pref = ResourcePreference.create(user_id: current_user.id)
      resource_params.values.each do |pref|
        resource_pref.update_attribute(pref, true)
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
      params.require('music').permit!
    end

    def feeling_params
      params.require('feelings').permit!
    end

    def activity_params
      params.require('activity').permit!
    end

    def resource_params
      params.require('resources').permit!
    end

    def time_params
      params.require('time').permit!
    end

    def media_params
      params.require('media').permit!
    end

    def completed?
      if current_user
        redirect_to landing_path if current_user.survey?
      end
    end
end
