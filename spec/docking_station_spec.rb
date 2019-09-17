require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to(:release_bike) }
    it { expect(subject.release_bike).to be_working }
    it { is_expected.to respond_to(:dock).with(1).argument }
    it { is_expected.to respond_to(:bike) }
end

