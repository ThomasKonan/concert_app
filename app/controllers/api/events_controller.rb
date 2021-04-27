require "songkickr"
require "setlistfm"

class Api::EventsController < ApplicationController
  def index
    remote = Songkickr::Remote.new Rails.application.credentials.songkick_api[:api_key]
    results = remote.events(params[:artist_name])
    results.results[0].location.city
    @events = results.results[0].display_name
    render "index.json.jb"
  end
end

# def venue
#   remote = Songkickr::Remote.new Rails.application.credentials.songkick_api[:api_key]
#   @results = remote.events(params[:venue])
# end

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
