json.extract! user, :id, :profile, :dni, :name, :surnames, :birthdate, :phone_1, :phone_2, :mail, :commands, :menu, :created_at, :updated_at
json.url user_url(user, format: :json)
