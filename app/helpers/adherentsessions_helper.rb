module AdherentsessionsHelper

    def log_in(adherent)
        session[:adherent_id] = @adherent.id
    end

    def current_adherent
        @current_adherent ||= Adherent.find_by(id: session[:adherent_id]) if session[:adherent_id]
        if @current_adherent.nil?
            redirect_to '/sign_in_adherent'
        end
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
