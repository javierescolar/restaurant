require 'test_helper'

class StocksControllerTest < ActionDispatch::IntegrationTest
  test "ruta index" do
      assert_routing '/stocks', controller: 'stocks', action: 'index'
  end

  test "ruta edit" do
      assert_routing '/stocks/2/edit', controller: 'stocks', action: 'edit', id: '2'
  end
end
