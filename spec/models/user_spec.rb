require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  before do
    sign_in user
  end
  
  it "can run tests" do
    expect(false).to be(false)
  end
end
