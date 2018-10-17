class SearchController < ApplicationController

  def index
    @stations = StationSearch.new(params[:q])
  end

end
