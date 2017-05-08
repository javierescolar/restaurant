require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  test "respuesta inválida(depende de una pregunta)" do
   answer1 = Answer.new({text_answer:"Al punto"})
   assert_not answer1.save
  end

  test "Pregunta válida" do
   answer1 = Answer.new({
     question_id: 1,
     text_answer:"Al punto"
     })
   assert answer1.save,answer1.errors.messages
  end
end
