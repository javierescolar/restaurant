require 'test_helper'

class PlateTest < ActiveSupport::TestCase
  test "plato inválido(descripcion mayor de 10 caracteres)" do
    plate1 = Plate.new({
        category_id:1,
        name: "Cocido Madrileño",
        price: 10.50,
        description: "abc",
        photo: "c:/mkdir/touch"
      })
    assert_not plate1.save, plate1.errors.messages
  end

  test "plato inválido(descripcion tener referencia a una categoria)" do
    plate1 = Plate.new({
        name: "Cocido Madrileño",
        price: 10.50,
        description: "Esto tiene mucho más de diez caracteres",
        photo: "c:/mkdir/touch"
      })
    assert_not plate1.save, plate1.errors.messages
  end

  test "plato inválido(debe tener una foto)" do
    plate1 = Plate.new({
        category_id:1,
        name: "Cocido Madrileño",
        price: 10.50,
        description: "Esto tiene mucho más de diez caracteres"
      })
    assert_not plate1.save, plate1.errors.messages
  end

end
