require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "insertar usuario valido" do
   user1 = User.new({profile_id:Profile.find_by(name:'Administrator').id,
                        dni:'10000000A',
                        name:"Javier",
                        surnames:"Escolar Salcedo",
                        password:'prueba',
                        mail:"prueba@prueba.com"})
   assert user1.save,user1.errors.messages
  end

  test "usuario invalido(nombre inferior a tres letras)" do
   user1 = User.new({profile_id:1,
                        dni:'10000000A',
                        name:"Ja",
                        surnames:"Escolar Salcedo",
                        password:'prueba',
                        mail:"prueba@prueba.com"})
   assert_not user1.save,user1.errors.messages
  end

  test "usuario invalido(formato telefono invalido)" do
   user1 = User.new({profile_id:1,
                        dni:'10000000A',
                        name:"Javier",
                        surnames:"Escolar Salcedo",
                        password:'prueba',
                        mail:"prueba@prueba.com",
                        phone_1:"9166396"})
   assert_not user1.save,user1.errors.messages
  end

  test "usuario invalido(nombre obligatorio)" do
   user1 = User.new({profile_id:1,
                        dni:'10000000A',
                        surnames:"Escolar Salcedo",
                        password:'prueba',
                        mail:"prueba@prueba.com",
                        phone_1:"9166396"})
   assert_not user1.save,user1.errors.messages
  end
end
