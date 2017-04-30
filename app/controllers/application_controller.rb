class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorize
  #controlamos la session de la aplicacion
  protected
    def authorize
       unless (User.find_by(id: session[:auth_id]))
         redirect_to :controller => 'auth', :action => 'new'
       end
    end

    def adminPermissions
      unless (session[:auth].present? && session[:auth]['profile_id'] == 1)
        flash[:danger] = "¡You haven´t permissions for that section, you aren´t a admin!"
        redirect_to root_path
      end
    end

    def ordersPermissions
      if session[:auth].present? &&  session[:auth]['profile_id'] == 2
        flash[:danger] = "¡You haven´t permissions for that section! You are a Chef"
        redirect_to root_path
      end
      unless (session[:auth].present? && session[:auth]['orders_view'] == true)
        flash[:danger] = "¡You haven´t permissions for that section!"
        redirect_to root_path
      end
    end

    def ordersHistoryPermissions
      unless (session[:auth].present? && session[:auth]['orders_history'] == true)
        flash[:danger] = "¡You haven´t permissions for that section!"
        redirect_to root_path
      end
    end

    def tablesPermissions
      unless (session[:auth].present? && session[:auth]['tables'] == true)
        flash[:danger] = "¡You haven´t permissions for that section!"
        redirect_to root_path
      end
    end

    def categoriesPermissions
      unless (session[:auth].present? && session[:auth]['category'] == true)
        flash[:danger] = "¡You haven´t permissions for that section!"
        redirect_to root_path
      end
    end

    def createDishesPermissions
      unless (session[:auth].present? && session[:auth]['create_plate'] == true)
        flash[:danger] = "¡You haven´t permissions for that section!"
        redirect_to root_path
      end
    end

    def productsPermissions
      unless (session[:auth].present? && session[:auth]['products'] == true)
        flash[:danger] = "¡You haven´t permissions for that section!"
        redirect_to root_path
      end
    end

    def quesionsAnswersPermissions
      unless (session[:auth].present? && session[:auth]['questions_answers'] == true)
        flash[:danger] = "¡You haven´t permissions for that section!"
        redirect_to root_path
      end
    end

    def chargesPermissions
      unless (session[:auth].present? && session[:auth]['profile_id'] == 2)
        flash[:danger] = "¡You haven´t permissions for that section!"
        redirect_to root_path
      end
    end


end
