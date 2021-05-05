require "setlistfm"

class Api::SetlistsController < ApplicationController
  def index
    setlistfm = Setlistfm.new(Rails.application.credentials.setlistfm_api[:api_key])
    @results = setlistfm.search_setlists({ artistName: params[:artist] })
    # @results = setlistfm.artist_setlists(mbid, { p: 2 }).body.setlist
    render "index.json.jb"
  end
end
