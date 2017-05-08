require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "mesa inválida(nombre obligatorio)" do
   category1 = Category.new
   assert_not category1.save
  end

  test "mesa válida" do
   category1 = Category.new({name:"Combo"})
   assert category1.save,category1.errors.messages
  end
end
