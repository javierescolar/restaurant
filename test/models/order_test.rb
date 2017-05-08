require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "comanda creada sin platos" do
    order1 = Order.new({table_id:1,user_id:1})
    assert order1.save, order1.errors.messages
  end
end
