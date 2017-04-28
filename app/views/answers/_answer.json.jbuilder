json.extract! answer, :id, :question_id, :text_answer, :created_at, :updated_at
json.url answer_url(answer, format: :json)
