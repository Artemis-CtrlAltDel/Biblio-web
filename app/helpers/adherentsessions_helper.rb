module AdherentsessionsHelper

    def log_in(adherent)
        session[:adherent_id] = @adherent.id
        sign_out
    end

    def current_adherent
        @current_adherent ||= Adherent.find_by(id: session[:adherent_id]) if session[:adherent_id]
        @current_adherent
    end

    def logged_in?
        !@current_adherent.nil?
    end

    def log_out
        session.delete(:adherent_id)
        @current_adherent = nil
    end

end
