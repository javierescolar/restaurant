require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "ruta index" do
      assert_routing '/categories', controller: 'categories', action: 'index'
  end

  test "ruta edit" do
      assert_routing '/categories/2/edit', controller: 'categories', action: 'edit', id: '2'
  end
end
