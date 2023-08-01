class Api::V1::Markets::TransitRoutesController < ApplicationController
  def index
    params[:original_lat] = params[:original_lat].to_f
    params[:original_lon] = params[:original_lon].to_f
    params[:destination_lat] = params[:destination_lat].to_f
    params[:destination_lon] = params[:destination_lon].to_f
    routes = TransitService.new.get_trips(params[:original_lat], params[:original_lon], params[:destination_lat], params[:destination_lon]) 
    render json: routes
  end
end
