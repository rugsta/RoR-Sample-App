require 'test_helper'


class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.create(name: "dave",
                     email: "new@email.com",
                     password: "password", password_confirmation: "password")
  end

  test "User can be be created" do
    assert @user.valid?
  end

  test "Username should be present" do
    assert_not @user.name.blank?
  end

  test "Email should be present" do
    assert_not @user.email.blank?
  end

  test "Email should be unique" do
    duplicate_user = @user.dup
    @user.save
    puts @user
    assert_not duplicate_user.valid?
  end

  test "Password should be 6 char minimum" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
