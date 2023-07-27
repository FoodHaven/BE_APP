class TransitSerializer
  include JSONAPI::Serializer

  attribute :date

  attribute :from do
    {
      lat: @object[:plan][:from][:lat],
      lon: @object[:plan][:from][:lon],
      name: @object[:plan][:from][:name]
    }
  end

  attribute :to do
    {
      lat: @object[:plan][:to][:lat],
      lon: @object[:plan][:to][:lon],
      name: @object[:plan][:to][:name]
    }
  end

  attribute :itineraries do
    @object[:plan][:itineraries].map do |itinerary|
      {
        duration: itinerary[:duration],
        startTime: itinerary[:startTime],
        endTime: itinerary[:endTime],
        legs: itinerary[:legs].map do |leg|
          {
            mode: leg[:mode],
            route: leg[:route],
            startTime: leg[:startTime],
            endTime: leg[:endTime]
          }
        end
      }
    end
  end

  attribute :transfers do
    {
      bufferTime: @object[:transfers][:bufferTime],
      defaultMinimumTime: @object[:transfers][:defaultMinimumTime],
      minimumTimes: @object[:transfers][:minimumTimes]
    }
  end
end
