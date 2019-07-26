class ListStations
  def execute
    @repo = Velib::Repository.new

    fetch_v_stations
  end

  private

  def fetch_v_stations
    @repo.list_v_stations
  end
end