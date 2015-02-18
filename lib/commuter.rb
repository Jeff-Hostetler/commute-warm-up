class Commuter

  def initialize(data)
    @data = data
  end

  def sort
    hash = {}
    @data.each do |trip|
      if hash[trip[0]]
        hash[trip[0]] << {
          week: trip[1].to_i,
          day: trip[2],
          mode: trip[3],
          inbound: trip[4].to_i,
          outbound: trip[5].to_i,
          distance: trip[6].to_f
        }
      else
        hash[trip[0]] = [{
          week: trip[1].to_i,
          day: trip[2],
          mode: trip[3],
          inbound: trip[4].to_i,
          outbound: trip[5].to_i,
          distance: trip[6].to_f
          }]
      end
    end
    new_hash = {}
    hash.each do |person, trips|
      trips.sort_by! {|trip| trip[:week]}
      new_hash_person = trips.sort_by { |trip| trip[:day]}
    end
    hash
  end

  def inbound_trip_time(person, week, day)
    data = self.sort
    time = "not found"
    data[person].each do |trip|
      if trip[:day] == day && trip[:week] == week
        time = "#{person} took #{trip[:inbound]} minutes to get to class on #{day} of week #{week}"
      end
    end
    time
  end

  def average_commute
    total = 0
    i = 0
    @data.each do |trip|
      total += (trip[4].to_i + trip[5].to_i)
      i += 1
    end
    average = total/i
    "The class average back and forth commute time was #{average} minutes long"
  end

  def fastest_walker
    trip_time = 1000
    fastest_walker = ''
    @data.each do |trip|
      if trip[3] == "Walk"
        if trip[4].to_i < trip_time
          trip_time = trip[4].to_i
          fastest_walker = trip[0]
        end
      end
    end
    "#{fastest_walker} walked the fastest to class in #{trip_time} minutes"
  end

end
