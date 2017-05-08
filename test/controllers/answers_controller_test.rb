require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  test "ruta index" do
      assert_routing '/answers', controller: 'answers', action: 'index'
  end

  test "ruta edit" do
      assert_routing '/answers/2/edit', controller: 'answers', action: 'edit', id: '2'
  end
end
