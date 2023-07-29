module Api
  module V1
    class MarketsController < ApplicationController
      def index
        markets = MarketService.new.all_markets(params[:latitude], params[:longitude], params[:radius])
        render json: MarketSerializer.new(markets)
      end

      def show
        market = Market.find(params[:id])
        render json: MarketSerializer.new(market)
      end
    end
  end
end
