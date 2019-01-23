# require "rails_helper"

# describe User, type: :model do
#  it "should not validate users without an email address" do
#    @user = FactoryBot.build(:user, email: "not_an_email")
#    expect(@user).to_not be_valid
#  end
# end (Already taken care of by Devise gem.)

# With FactoryBot, build will basically do the same thing as new. Using build
# will generate the user only in the memory and not save it to the database.
# This way, you can test validations individually after "building" a user.
