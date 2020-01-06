class Users::PreferencesController < ApplicationController
  before_action :logged_in?
  def index; end

  def edit
    @user = current_user
  end

  def update
    destroy
    update_feelings; update_music_preferences; update_activity_preferences
    update_time_preferences; update_media_preferences


    flash[:success] = 'Preferences updated'
    redirect_to '/preferences'
  end

  private

  def destroy
    current_user.feeling_preferences.destroy_all
    current_user.music_preferences.destroy_all
    current_user.activity_preferences.destroy_all
    current_user.time_preference.destroy
    current_user.media_preference.destroy
  end

  def update_feelings
    feeling_params.each do |feel|
      current_user.feeling_preferences.create(feeling: feel)
    end
  end

  def update_music_preferences
    music_params.each do |gen|
      current_user.music_preferences.create(genre: gen)
    end
    custom_music_params.values.each do |gen|
      if gen != ''
        current_user.music_preferences.create(genre: gen)
      end
    end
  end

  def update_activity_preferences
    activity_params.each do |activity|
      current_user.activity_preferences.create(description: activity)
    end
    custom_activity_params.values.each do |act|
      if act != ''
        current_user.activity_preferences.create(description: act)
      end
    end
  end

  def update_time_preferences
    time = TimePreference.create(user_id: current_user.id)
    time_params.each do |pref|
      time.update_attribute(pref, true)
    end
  end

  def update_media_preferences
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
end
