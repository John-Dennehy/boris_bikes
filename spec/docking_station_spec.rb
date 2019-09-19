require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to(:release_bike) }
    it { is_expected.to respond_to(:bike) }
    it { is_expected.to respond_to(:dock).with(1).argument }

    # it 'releases a working bike' do
    #      expect(subject.release_bike).to be_working
    # end

    describe '#dock' do
        it 'docks something' do
            bike = Bike.new
            expect(subject.dock(bike)).to eq bike
        end

        it ' raises error if dock already in use' do
            bike_1 = Bike.new
            bike_2 = Bike.new

            subject.dock(bike_1)

            expect{subject.dock(bike_2)}.to raise_error("Dock in use")
        end
    end

    describe '#release_bike' do
        it 'release a bike' do
            # setup
            my_bike = Bike.new
            subject.dock(my_bike)

            # execute
            released_bike = subject.release_bike

            # assert
            expect(released_bike).to eq my_bike
        end

        it ' raise error if no bike docked' do
            expect{subject.release_bike}.to raise_error("No bike available")
        end
    end


end