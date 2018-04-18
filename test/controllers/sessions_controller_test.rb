require "test_helper"

describe SessionsController do

  describe "create" do
    it "should log in an existing user and redirect to the root route" do
      # before_count = User.count
      existing_user = users(:ada)

      proc {
        perform_login(existing_user)
      }.must_change 'User.count', 0

      must_respond_with :redirect
      must_redirect_to root_path
      # User.count.must_equal before_count
    end

    it "should create a new user and redirect to the root route" do
      new_user = User.new(
        provider: 'github',
        uid: 999,
        email: 'test@test.com',
        name: 'test user'
      )

      proc {
        perform_login(new_user)
      }.must_change 'User.count', 1

      must_respond_with :redirect
      must_redirect_to root_path
    end
  end

end
