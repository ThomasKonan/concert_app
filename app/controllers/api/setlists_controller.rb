# require "setlistfm"
# require "httparty"
# require "faraday"
# require "faraday_middleware"

class Api::SetlistsController < ApplicationController
  def index
    setlistfm = Setlistfm.new(Rails.application.credentials.setlistfm_api[:api_key])
    mbid = setlistfm.search_artists({ artistName: "BABY METAL" }).as_json["body"]["artist"][0]["mbid"]
    @results = setlistfm.artist_setlists(mbid, { p: 2 }).body.setlist
    render "index.json.jb"
  end
end

# setlistfm.search_setlists({artistMbid: '27e2997f-f7a1-4353-bcc4-57b9274fa9a4'})

# def search_setlists(params = {})
#   response = http.get("/rest/#{api_version}/search/setlists", params)
# end

#   module APIMethod
#     def artist(mbid)
#       http.get("/rest/#{api_version}/artist/#{mbid}")
#     end

#     def artist_setlists(mbid, params = {})
#       http.get("/rest/#{api_version}/artist/#{mbid}/setlists", params)
#     end

#     def city(geoid)
#       http.get("/rest/#{api_version}/city/#{geoid}")
#     end

#     def search_artists(params = {})
#       http.get("/rest/#{api_version}/search/artists", params)
#     end

#     def search_cities(params = {})
#       http.get("/rest/#{api_version}/search/cities", params)
#     end

#     def search_countries(params = {})
#       http.get("/rest/#{api_version}/search/countries", params)
#     end

#     def search_setlists(params = {})
#       http.get("/rest/#{api_version}/search/setlists", params)
#     end

#     def search_venues(params = {})
#       http.get("/rest/#{api_version}/search/venues", params)
#     end

#     def setlist_version(version_id, params = {})
#       http.get("/rest/#{api_version}/setlist/version/#{version_id}", params)
#     end

#     def setlist(setlist_id, params = {})
#       http.get("/rest/#{api_version}/setlist/#{setlist_id}", params)
#     end

#     def user(user_id, params = {})
#       http.get("/rest/#{api_version}/user/#{user_id}", params)
#     end

#     def user_attended(user_id, params = {})
#       http.get("/rest/#{api_version}/user/#{user_id}/attended", params)
#     end

#     def user_edited(user_id, params = {})
#       http.get("/rest/#{api_version}/user/#{user_id}/edited", params)
#     end

#     def venue(venue_id, params = {})
#       http.get("/rest/#{api_version}/venue/#{venue_id}", params)
#     end

#     def venue_setlists(venue_id, params = {})
#       http.get("/rest/#{api_version}/venue/#{venue_id}/setlists", params)
#     end
#   end
# end
