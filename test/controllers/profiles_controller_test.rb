require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest

  test "El index debe contener 2 perfiles" do
    assert_equal(Profile.all.count,2)
  end
  test "ruta index" do
      assert_routing '/profiles', controller: 'profiles', action: 'index'
  end

  test "ruta edit" do
      assert_routing '/profiles/2/edit', controller: 'profiles', action: 'edit', id: '2'
  end

  test "ruta update" do
      assert_routing({ method: 'put', path: '/profiles/2' }, { controller: "profiles", action: "update", id: "2" })
  end


end
