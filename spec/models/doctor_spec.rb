require 'rails_helper'

RSpec.describe Doctor, type: :model do

  describe 'phone be valid' do
    it "should be valid with phone" do
      expect(Doctor.create(phone: '2123123123', password: '123123')).to be_valid
    end
  end

  describe 'phone not be valid' do
    it "got phone validation errors" do
      expect { Doctor.create!(phone: nil, password: '123123') }.to raise_error(ActiveRecord::RecordInvalid,
        "Validation failed: Phone can't be blank, Phone is not a number, Phone is too short (minimum is 9 characters)")
    end
  end
end
