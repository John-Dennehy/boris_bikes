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
    if @bikes[-1].working? == true  
      @bikes.pop
    else
      raise "No working bikes available"
    end
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
end
