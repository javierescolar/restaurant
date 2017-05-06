require 'test_helper'

class TableTest < ActiveSupport::TestCase
  test "mesa inválida(nombre obligatorio)" do
   table1 = Table.new({capacity:5})
   assert_not table1.save
  end

  test "mesa válida" do
   table1 = Table.new({number:77,capacity:5})
   assert table1.save,table1.errors.messages
  end
end
