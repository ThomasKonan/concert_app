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
      remote.location_search(query: "Boston, MA", per_page: 2).results
      @events = remote.metro_areas_events(18842).results
      render "index.json.jb"
    end
  end
end

# def index
#   remote = Songkickr::Remote.new Rails.application.credentials.songkick_api[:api_key]
#   @results = remote.events(params[:band])
#   # @results = remote.events(params[:metro_area_name])
#   # @results = remote.artist_search(artist_name: "Iron Maiden", per_page: "10").results
#   # @results.each do |result|
#   #   print result.display_name + "\n"
#   # end
#   # print "\n"
# end

# def index
#   remote = Songkickr::Remote.new Rails.application.credentials.songkick_api[:api_key]
#   @results = remote.events(params[:artist_name])
# end
