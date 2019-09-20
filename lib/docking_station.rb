require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "No bike available" if empty?

    raise "No working bike available" if next_working_bike == nil
    return @bikes.delete(next_working_bike)
  end

  def dock(bike)
    raise "Dock is full" if full?

    @bikes << bike
  end

  # private

  def full?
    @bikes.size >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

  def next_working_bike
    return_bike = nil

    @bikes.each do |bike|
      if bike.working?
        return_bike = bike
      end
    end
    return return_bike
  end
end
