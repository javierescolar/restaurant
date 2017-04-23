
class Auth
  attr_accessor :auth
  def getAuth
    return session[:auth]
  end

  def login(value)
    session[:auth] = value
  end

  def logout
    session[:auth] = nil
  end
end
