class MarketSerializer
  include JSONAPI::Serializer
  attributes :name, 
            :address, 
            :site, 
            :description, 
            :fnap, 
            :snap_option, 
            :accepted_payment, 
            :longitude, 
            :latitude,
            :id
end