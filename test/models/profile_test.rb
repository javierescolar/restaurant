require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  test "perfil_administrador" do
   profile1 = Profile.new({ name:"Administrator" })
   assert_equal(  profile1.name,'Administrator')
  end

  test "perfil invalido(nombre obligatorio)" do
   profile2 = Profile.new
   assert_not profile2.save
  end

  test "perfil válido" do
   profile2 = Profile.new({ name:"Administrator" })
   assert profile2.save
  end

end
