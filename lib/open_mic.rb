class OpenMic
  attr_reader :event,
              :performers

  def initialize(event)
    @event = event
    @performers = []
  end

  def location
    @event[:location]
  end

  def date
    @event[:date]
  end

  def welcome(performer)
    @performers << performer
  end

  def repeated_jokes?
    false
  end



end

# def initialize args
#   args.each do |k,v|
#     instance_variable_set("@#{k}", v) unless v.nil?
#   end
# end
