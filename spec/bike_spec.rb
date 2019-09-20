require 'bike'

describe Bike do
  it { is_expected.to respond_to(:working?) }
  describe '#report_broken' do
    it 'responds to #report_broken' do
      my_bike = Bike.new
      expect(my_bike).to respond_to(:report_broken)
    end
  end 

  describe "#working?" do
    it 'reports false if reported broken' do
      my_bike = Bike.new
      my_bike.report_broken
      expect(my_bike.working?).to eq false
    end

    it "reports true on new bike" do
      my_bike = Bike.new
      expect(my_bike.working?).to eq true
    end

  end
end
