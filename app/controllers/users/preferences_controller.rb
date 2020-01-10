class Users::PreferencesController < ApplicationController
  before_action :logged_in?
  def index; end

  def edit; end

  def update
    if all_resources_checked?
      destroy
      update_feelings; update_music_preferences; update_activity_preferences
      update_time_preferences; update_media_preferences; update_resource_preferences
      flash[:success] = 'Preferences updated'
      redirect_to '/preferences'
    else
      flash[:error] = 'Please select preferences for each category'
      redirect_to '/preferences/edit'
    end


  end

  private

    def all_resources_checked?
      !params.require(:activity).permit!.to_h.all? { |k,v| v != '' } &&
      !params.require(:music).permit!.to_h.all? { |k,v| v != '' } &&
      params.keys.include?('media') &&
      params.keys.include?('feelings') &&
      params.keys.include?('time') &&
      params.keys.include?('resources')
    end

    def destroy
      current_user.feeling_preferences.destroy_all
      current_user.music_preferences.destroy_all
      current_user.activity_preferences.destroy_all
      current_user.resource_preference.destroy
      current_user.time_preference.destroy
      current_user.media_preference.destroy
    end

    def update_feelings
      feeling_params.values.each do |feel|
        current_user.feeling_preferences.create(feeling: feel)
      end
    end

    def update_music_preferences
      music_params.values.each do |gen|
        if gen != ''
          current_user.music_preferences.create(genre: gen)
        end
      end
    end

    def update_activity_preferences
      activity_params.values.each do |activity|
        if activity != ''
          current_user.activity_preferences.create(description: activity)
        end
      end
    end

    def update_resource_preferences
      resource_pref = ResourcePreference.create(user_id: current_user.id)
      resource_params.values.each do |pref|
        resource_pref.update_attribute(pref, true)
      end
    end

    def update_time_preferences
      time = TimePreference.create(user_id: current_user.id)
      time_params.values.each do |pref|
        time.update_attribute(pref, true)
      end
    end

    def update_media_preferences
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
end
