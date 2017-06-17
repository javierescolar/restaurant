module ApplicationHelper
  def formatDateTime(time)
    return time.strftime("%d/%m/%Y %H:%M:%S")
  end

  def formatTime(time)
    return time.strftime("%H:%M:%S")
  end
  
  def formatDecimalNumber (quantity)
    return '%.2f' % quantity
  end
end
