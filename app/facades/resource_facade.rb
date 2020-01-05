class ResourceFacade
  attr_reader :suggestion, :resource

  def initialize(user)
    @user = user
  end

  def quote
    DbtQuote.random
  end

  def new_entry
    @entry ||= @user.journal_entries.new
  end

  def get_resource
    service = PenpalService.new(user_info)
    raw_data = service.get_suggestion
    @suggestion = raw_data[:type]
    @resource = Object.const_get(raw_data[:type].capitalize).new(raw_data[:data], @user)
  end

  private

    def user_info
      {
        current_feeling: @user.daily_feelings.last,
        feeling_preferences: @user.feeling_info,
        feeling_categories: @user.feeling_category_info,
        music_preferences: @user.music_info,
        media_preferences: @user.media_info
      }
    end

    def feeling_info
      hash = {}
      @user.feeling_preferences.each do |feeling_pref|
        hash[feeling_pref.feeling] = {feeling_category_id: feeling_pref.feeling_category_id}
      end
      hash
    end

    def feeling_category_info
      hash = {}
      @user.feeling_categories.each do |feeling_cat|
        hash[feeling_cat.id] = feeling_cat.category
      end
      hash
    end

    def music_info
      @user.music_preferences.map do |preference|
        preference.genre
      end
    end

    def media_info
      media_info ||= @user.media_preferences
      {
        dogs: media_info.dogs,
        cats: media_info.cats,
        babies: media_info.babies,
        animals: media_info.animals,
        celestial: media_info.celestial,
        landscapes: media_info.landscapes
      }
    end
end
