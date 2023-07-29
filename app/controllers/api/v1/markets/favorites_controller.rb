class Api::V1::Markets::FavoritesController < ApplicationController
  def index
    markets = MarketService.new.favorite_markets(params[:market_ids])
    render json: markets
  end
end