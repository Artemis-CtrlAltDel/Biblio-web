class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    include AdherentsessionsHelper

    def current_adherent
        @current_adherent ||= Adherent.find_by(id: session[:adherent_id])
    end
    
    def logged_in?
        !current_adherent.nil?
    end
    
    def log_out
        session.delete(:adherent_id)
        @current_adherent = nil
    end
    
    def authenticate
        unless logged_in?
          flash[:danger] = "Veuillez de se connecter."
          redirect_to login_url
        end
    end

end
