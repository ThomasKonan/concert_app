class Api::UserEventsController < ApplicationController
  def index
    @user_events = UserEvent.all
    render "index.json.jb"
  end

  def create
    @user_event = UserEvent.new(
      artist: params[:artist],
      location: params[:location],
      venue: params[:venue],
      date: params[:date],
      # user_id: current_user.id,
    )
    if @user_event.save
      render "show.json.jb"
    else
      render json: { errors: @user_event.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @user_event = UserEvent.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @user_event = UserEvent.find_by(id: params[:id])
    @user_event.artist = params[:artist] || @user_event.artist
    @user_event.venue = params[:venue] || @user_event.venue
    @user_event.location = params[:location] || @user_event.location
    @user_event.date = params[:date] || @user_event.date
    if @user_event.save
      render "show.json.jb"
    else
      render json: { errors: @user_event.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @user_event = UserEvent.find_by(id: params[:id])
    @user_event.destroy
    render json: { message: "Event successfully deleted" }
  end
end
