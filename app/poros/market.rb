class Market
  attr_reader :name, 
              :address, 
              :site, 
              :description, 
              :fnap, 
              :snap_option, 
              :accepted_payment, 
              :longitude, 
              :latitude
  def initialize(data)
    @name             = data[:name]
    @address          = data[:address]
    @site             = data[:site]
    @description      = data[:description]
    @fnap             = data[:fnap]
    @snap_option      = data[:snap_option]
    @accepted_payment = data[:accepted_payment]
    @longitude        = data[:longitude]
    @latitude         = data[:latitude]
  end
end