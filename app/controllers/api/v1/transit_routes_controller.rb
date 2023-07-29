module Api
  module V1
    class TransitRoutesController < ApplicationController
      def index
        market = Market.find(params[:market_id])
        routes = TransitFacade.plan_trip(origin_lat, origin_lon, @market.latitude, @market.longitude)
      end
    end
  end
end
