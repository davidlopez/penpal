class PenpalService

  def get_suggestion
    get_json
  end

  private

    def conn
      Faraday.new(ENV['PENPAL_URL']) do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def get_json
      response = conn.get
      JSON.parse(response.body)
    end
end
