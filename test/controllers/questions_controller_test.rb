require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "ruta index" do
      assert_routing '/questions', controller: 'questions', action: 'index'
  end

  test "ruta edit" do
      assert_routing '/questions/2/edit', controller: 'questions', action: 'edit', id: '2'
  end
end
