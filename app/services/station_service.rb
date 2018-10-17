class StationService

  def initialize(zip)
    @zip = zip
  end

  def station_search
    response = get_json("/api/alt-fuel-stations/v1/nearest.json?location=#{@zip.to_i}&limit=10")
  end

  private

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-API-Key"] = ENV["API-KEY"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
