require 'test_helper'

class ChargesControllerTest < ActionDispatch::IntegrationTest
  test "ruta index" do
      assert_routing '/charges', controller: 'charges', action: 'kitchen'
  end


end
