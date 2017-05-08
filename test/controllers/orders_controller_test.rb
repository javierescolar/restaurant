require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest

  test "encargos en el show de la comanda" do
    charges1 = Order.find(1).charges.count
    assert_equal(charges1,2)
  end

  test "comandas abiertas en el index" do
    order1 = Order.find_by(paid:false)
    assert_equal(order1.id,1)
  end

  test "ruta index" do
      assert_routing '/orders', controller: 'orders', action: 'index'
  end

  test "ruta show" do
      assert_routing '/orders/1', controller: 'orders', action: 'show', id: "1"
  end

  test "ruta edit" do
      assert_routing '/orders/2/edit', controller: 'orders', action: 'edit', id: '2'
  end
end
