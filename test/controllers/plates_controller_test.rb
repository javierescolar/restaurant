require 'test_helper'

class PlatesControllerTest < ActionDispatch::IntegrationTest
  test "ruta index" do
      assert_routing '/plates', controller: 'plates', action: 'index'
  end

  test "ruta show" do
      assert_routing '/plates/1', controller: 'plates', action: 'show', id: "1"
  end

  test "ruta edit" do
      assert_routing '/plates/2/edit', controller: 'plates', action: 'edit', id: '2'
  end
end
