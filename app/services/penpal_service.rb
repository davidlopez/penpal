class PenpalService

  def self.get_suggestion(user_info)
    get_json(user_info)
  end

  private

    def self.conn(user_info)
      Faraday.new(ENV['PENPAL_URL']) do |f|
        f.adapter Faraday.default_adapter
        f.params[:user_info] = user_info
      end
    end

    def self.get_json(user_info)
      response = self.conn(user_info).get
      JSON.parse(response.body, symbolize_names: true)
    end
end
