module ResposessionsHelper

    def log_in(respo)
        session[:respo_id] = @respo.id
    end

    def current_respo
        @current_respo ||= session.find_by(id: session[:respo_id]) if session[:respo_id]
    end

    def logged_in?
        !@current_respo.nil?
    end

    def log_out
        session.delete(:respo_id)
        @current_respo = nil
    end
    
end
