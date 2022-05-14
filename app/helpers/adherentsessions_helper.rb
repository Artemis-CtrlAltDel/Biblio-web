module AdherentsessionsHelper

    def log_in(adherent)
        session[:adherent_id] = @adherent.id
    end

    def current_adherent
        @current_adherent ||= session.find_by(id: session[:adherent_id]) if session[:adherent_id]
    end

    def logged_in?
        !@current_adherent.nil?
    end

    def log_out
        session.delete(:adherent_id)
        @current_adherent = nil
    end

end
