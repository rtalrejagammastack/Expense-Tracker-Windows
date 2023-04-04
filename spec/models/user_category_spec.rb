require 'rails_helper'

RSpec.describe UserCategory, type: :model do

  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it "must have user" do
    usercategory = build(:user_category)
    expect(usercategory).to be_valid_user
  end
  # it "not equals to default_category" do
  #   usercategory = create(:user_category)
  #   expect(usercategory).to be_is_Valid
  # end

  # it "not equals to default_category" do
  #   usercategory = create(:user_category)
  #   expect(usercategory).not_to be_is_Valid
  # end

end
