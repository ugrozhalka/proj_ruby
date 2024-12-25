require 'test_helper'

class WishesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one) # Предполагается, что у вас есть fixture для пользователей
    @wish = wishes(:one) # Предполагается, что у вас есть fixture для желаний
    log_in_as(@user) # Логиним пользователя перед тестами
  end

  test "should not create wish when not logged in" do
    delete logout_path
    assert_no_difference('Wish.count') do
      post wishes_path, params: { wish: { title: "Unauthorized Wish", description: "This should not work." } }
    end
    assert_redirected_to root_path # Проверяем редирект на главную страницу для неавторизованных пользователей
  end

  private

  def log_in_as(user)
    post login_path, params: { session: { email: user.email, password: 'password' } }
  end
end




