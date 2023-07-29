module Api
  module V1
    class MarketsController < ApplicationController
      def index
        params[:longitude] = params[:longitude].to_f
        params[:latitude] = params[:latitude].to_f
        params[:radius] = params[:radius].to_f
        markets = MarketService.new.all_markets(params[:latitude], params[:longitude], params[:radius])
        render json: markets
      end

      def show
        market = Market.find(params[:id])
        render json: MarketSerializer.new(market)
      end
    end
  end
end
