require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "pregunta inválida(depende de un produto)" do
   question1 = Question.new({text_question:"¿Cómo quiere la carne?"})
   assert_not question1.save
  end

  test "Pregunta válida" do
   question1 = Question.new({
     product_id: 1,
     text_question:"¿Cómo quiere la carne?"
     })
   assert question1.save,question1.errors.messages
  end
end
