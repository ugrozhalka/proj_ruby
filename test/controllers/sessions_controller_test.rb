require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one) # Используем фикстуру для пользователя
  end

  test "should create session with valid credentials" do
    post login_path, params: { email: @user.email, password: 'password' } # Используем login_path для создания сессии
    assert_redirected_to root_path
    assert_equal @user.id, session[:user_id]
    assert_equal "Successfully logged in", flash[:notice]
  end

  test "should destroy session" do
    delete logout_path # Используем logout_path для выхода из сессии
    assert_redirected_to root_path
    assert_nil session[:user_id]
    assert_equal "Successfully logged out", flash[:notice]
  end
end



