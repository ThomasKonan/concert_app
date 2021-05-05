require "songkickr"
require "setlistfm"

class Api::EventsController < ApplicationController
  def index
    remote = Songkickr::Remote.new Rails.application.credentials.songkick_api[:api_key]
    if params[:search_type] == "Artist"
      results = remote.events(params[:artist_name])
      p results.results
      results.results[0].location.city
      @events = results.results
      render "index.json.jb"
    elsif params[:search_type] == "Location"
      location_id = remote.location_search(query: params[:artist_name], per_page: 2).results[0].as_json["metro_area"]["id"]
      @events = remote.metro_areas_events(location_id).results
      render "index.json.jb"
    end
  end
end