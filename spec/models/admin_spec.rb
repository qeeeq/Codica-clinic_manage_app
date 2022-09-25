require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "should be valid with valid attributes" do
    expect(Admin.new(phone: '123123123', password: '123123')).to be_valid
  end

  it "must not be valid with no valid attributes" do
    expect(Admin.new(phone: 'a', password: '123')).to be_valid
  end

  # it 'raises a VeryBad::NotCool error' do
  #   expect(instance.name).to eq 'old_value'
  #   expect { instance.err! }.to raise_error(VeryBad::NotCool)
  #   expect(instance.reload.name).to eq 'erroring instance'
  # end
end


