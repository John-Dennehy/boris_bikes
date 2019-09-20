require 'bike'

describe Bike do
  it { is_expected.to respond_to(:working?) }
  describe '#report_broken' do
    it 'responds to #report_broken' do
      my_bike = Bike.new
      expect(my_bike).to respond_to(:report_broken)
    end
    
    it 'updates #working? as false' do
      my_bike = Bike.new
      my_bike.report_broken
      expect(my_bike.working?).to eq false
    end
  end
end
