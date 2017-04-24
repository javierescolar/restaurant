module AuthHelper
  def newPost(date)
    return ((Time.now.to_date - date.to_date).to_i <= 3) 
  end
end
