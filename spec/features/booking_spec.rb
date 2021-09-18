require 'rails_helper'

RSpec.describe Booking do
  subject { described_class.new(check_in_date: 2018-01-01, check_out_date: 2019-01-01, number_of_guests: 3 ) }
  describe 'validations' do

    # shorter solution with gem https://github.com/thoughtbot/shoulda-matchers
    describe 'check_in_date' do
      it 'must be present' do
        booking = 
        expect(subject).to be_valid
        subject.check_in_date = nil
        expect(subject).to_not be_valid
      end
    end

    describe 'check_out_date' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.check_out_date = nil
        expect(subject).to_not be_valid
      end
    end

    describe ':number_of_guests,' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.number_of_guests = nil
        expect(subject).to_not be_valid
      end
    end

  end
end