module ResposessionsHelper

    def sign_in(respo)
        session[:respo_id] = @respo.id
        log_out
    end

    def current_respo
        @current_respo ||= Respo.find_by(id: session[:respo_id]) if session[:respo_id]
        @current_respo
    end

    def signed_in?
        !@current_respo.nil?
    end

    def sign_out
        session.delete(:respo_id)
        @current_respo = nil
    end
    
end
