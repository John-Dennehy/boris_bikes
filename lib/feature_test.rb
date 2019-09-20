require_relative 'bike'
require_relative 'docking_station'

station = DockingStation.new
mybike = Bike.new
mybike.report_broken
station.dock(mybike)
puts station.release_bike



# # mybike.report_broken
#
# puts mybike.working?
