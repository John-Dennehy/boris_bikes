require_relative 'bike'

class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bike available" if empty?

    @bikes.pop
  end

  def dock(bike)
    raise "Dock is full" if full?

    @bikes << bike
  end

  private
  
  def full?
    @bikes.size >= 20 ? true : false
  end

  def empty?
    @bikes.empty?
  end
end