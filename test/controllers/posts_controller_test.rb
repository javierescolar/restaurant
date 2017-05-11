require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "ruta index" do
      assert_routing '/posts', controller: 'posts', action: 'index'
  end

  test "ruta edit" do
      assert_routing '/posts/2/edit', controller: 'posts', action: 'edit', id: '2'
  end
end
