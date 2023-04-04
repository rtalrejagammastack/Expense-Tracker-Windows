require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "can run tests" do
    expect(false).to be(false)
  end
end
it "must have age greater than 21" do
  dummy = FactoryBot.create(:dummy, age: 11)
  expect(dummy.age).to be >= 18
end