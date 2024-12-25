require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one) # Используйте фикстуру для первого пользователя
    @user_two = users(:two) # Используйте фикстуру для второго пользователя
  end

  test "should get index" do
    get users_index_path
    assert_response :success
    assert_select 'h1', 'Wish Cards' # Предположим, что в представлении есть заголовок h1 с текстом "Регистрация"
  end

  test "should create user" do
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { login: 'NewUser', email: 'newuser@example.com', password: 'password' } }
    end
    assert_redirected_to root_path
    assert_equal 'Registration completed. You are now logged in.', flash[:notice]
  end

end


