require 'test_helper'

class TablesControllerTest < ActionDispatch::IntegrationTest
  test "ruta index" do
      assert_routing '/tables', controller: 'tables', action: 'index'
  end

  test "ruta edit" do
      assert_routing '/tables/2/edit', controller: 'tables', action: 'edit', id: '2'
  end
end
