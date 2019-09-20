require 'bike'

describe Bike do
  it { is_expected.to respond_to(:working?) }
  describe '#report_broken' do
    it 'updates #working? as false' do
      my_bike = Bike.new
      expect(my_bike).to respond_to(:report_broken)
    end
  end
end
