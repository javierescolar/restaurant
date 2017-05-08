require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "ruta index" do
      assert_routing '/products', controller: 'products', action: 'index'
  end

  test "ruta edit" do
      assert_routing '/products/2/edit', controller: 'products', action: 'edit', id: '2'
  end
end
