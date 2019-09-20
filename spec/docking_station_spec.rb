require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to(:release_bike) }
    it { is_expected.to respond_to(:bikes) }
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'accepts a value for the capacity' do
        # setup
        new_capacity = 10
        station = DockingStation.new(new_capacity)
        # executes
        the_capacity = station.capacity
        # asserts
        expect(the_capacity).to eq new_capacity
    end

    it 'uses default capacity if no argument is passed' do
        station = DockingStation.new
        the_capacity = station.capacity
        expect(the_capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    describe '#dock' do
        it 'docks something' do
            my_bike = Bike.new
            station = DockingStation.new
            station.dock(my_bike)
            expect(station.bikes[-1]).to eq my_bike
        end

        it ' raises error if dock is full' do
            # setup
            station = DockingStation.new
            num = DockingStation::DEFAULT_CAPACITY
            num.times{station.dock(Bike.new)}
            my_bike = Bike.new
            expect{ station.dock(my_bike) }.to raise_error("Dock is full")
        end
    end

    describe '#release_bike' do
        it 'release a bike' do
            # setup
            my_bike = Bike.new
            station = DockingStation.new
            station.dock(my_bike)

            # execute
            released_bike = station.release_bike

            # assert
            expect(released_bike).to eq my_bike
        end

        it 'raise error if no bike docked' do
            expect{ subject.release_bike }.to raise_error("No bike available")
        end

        it "doesn't release broken bike" do
          station = DockingStation.new
          bike = Bike.new
          bike.report_broken
          station.dock(bike)
          expect {station.release_bike}.to raise_error "No working bikes available"
        end
    end
end
