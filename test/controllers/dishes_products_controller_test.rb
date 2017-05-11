require 'test_helper'

class DishesProductsControllerTest < ActionDispatch::IntegrationTest

  test "ruta index" do
      assert_routing '/plates/1/products', controller: 'dishes_products', action: 'index', id: "1"
  end

  test "ruta new" do
      assert_routing '/plates/1/products/new', controller: 'dishes_products', action: 'new', id: "1"
  end

  test "ruta edit" do
      assert_routing '/plates/2/products/edit/1', controller: 'dishes_products', action: 'edit', id: "2", registro: "1"
  end

end
