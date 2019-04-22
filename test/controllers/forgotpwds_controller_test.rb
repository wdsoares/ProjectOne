require 'test_helper'

class ForgotpwdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forgotpwd = forgotpwds(:one)
  end

  test "should get index" do
    get forgotpwds_url
    assert_response :success
  end

  test "should get new" do
    get new_forgotpwd_url
    assert_response :success
  end

  test "should create forgotpwd" do
    assert_difference('Forgotpwd.count') do
      post forgotpwds_url, params: { forgotpwd: {  } }
    end

    assert_redirected_to forgotpwd_url(Forgotpwd.last)
  end

  test "should show forgotpwd" do
    get forgotpwd_url(@forgotpwd)
    assert_response :success
  end

  test "should get edit" do
    get edit_forgotpwd_url(@forgotpwd)
    assert_response :success
  end

  test "should update forgotpwd" do
    patch forgotpwd_url(@forgotpwd), params: { forgotpwd: {  } }
    assert_redirected_to forgotpwd_url(@forgotpwd)
  end

  test "should destroy forgotpwd" do
    assert_difference('Forgotpwd.count', -1) do
      delete forgotpwd_url(@forgotpwd)
    end

    assert_redirected_to forgotpwds_url
  end
end
