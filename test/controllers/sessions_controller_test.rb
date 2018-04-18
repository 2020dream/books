require "test_helper"

describe SessionsController do

  describe "create" do
    it "should log in an existing user and redirect to the root route" do
      before_count = User.count
      existing_user = users(:ada)

      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(existing_user))

      proc {
        get auth_callback_path(existing_user.provider)
      }.must_change 'User.count', 0

      must_redirect_to root_path
      User.count.must_equal before_count
    end
  end

end
