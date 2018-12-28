class ImpressionsController < ApplicationController
  def index
    @impressions_arts = Impression.where(controller_name: :arts, action_name: :index)
    @impressions_art = Impression.where(controller_name: :arts, action_name: :show)
    @impressions_artist = Impression.where(controller_name: :artists, action_name: :show)

    @arts = Art.all
    @artists = Artist.all
  end
end
