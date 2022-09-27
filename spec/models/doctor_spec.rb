require 'rails_helper'

RSpec.describe Doctor, type: :model do
  subject { described_class.new(phone: '2123123123', password: "123123") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.phone = '123123'
    expect(subject).to_not be_valid
  end
end
