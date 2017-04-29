module PlatesHelper
  def showEditingPermissions
    return session[:auth]["create_plate"]
  end
end
