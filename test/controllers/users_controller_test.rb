require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "ruta index" do
      assert_routing '/users', controller: 'users', action: 'index'
  end

  test "ruta show" do
      assert_routing '/users/1', controller: 'users', action: 'show', id: "1"
  end

  test "ruta edit" do
      assert_routing '/users/2/edit', controller: 'users', action: 'edit', id: '2'
  end

end
