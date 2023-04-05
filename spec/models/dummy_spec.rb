require 'rails_helper'

RSpec.describe Dummy, type: :model do
  # it "must have age greater than 21" do
  #   dummy = FactoryBot.create(:dummy, age: 11)
  #   expect(dummy.age).to be >= 18
  # end

  it "must have email properly validate" do
    dummy = create(:dummy)
    dummy2 = create(:dummy)
    # expect(dummy.email).to eq("hello+2@gmail.com")
    # expect(dummy2.email).to eq("hello+3@gmail.com")
  end
end
