require_relative 'bike'
require_relative 'docking_station'

station = DockingStation.new
bike = Bike.new
bike.report_broken
station.dock(bike)
p station.release_bike



# # mybike.report_broken
#
# puts mybike.working?
