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
    return @bikes.pop(next_working_bike)
    raise "No working bike available"
  end

  def dock(bike)
    raise "Dock is full" if full?

    @bikes << bike
  end

  private

  def full?
    @bikes.size >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

  def next_working_bike
    @bikes.each do |bike|
      if bike.working?
        return @bikes.index(bike)
      else

      end
    end
  end
end
