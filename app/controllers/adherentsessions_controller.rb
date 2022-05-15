class AdherentsessionsController < ApplicationController

    # before_action :redirect_logged_in, only:[:new,:create]
    
    def new
        if logged_in?
            redirect_to current_adherent
        end
        @adherent = Adherent.new
    end

    def create
        if logged_in?
            redirect_to current_adherent
        end
        
        @adherent = Adherent.find_by email: params[:adherent][:email].downcase

        if @adherent && @adherent.authenticate(params[:adherent][:password])
            session[:adherent_id] = @adherent.id
            redirect_to @adherent
        else
            flash[:danger] = 'Combinaison Email/Mot de passe invalide'
            redirect_to login_path
        end
    end

    def destroy
        log_out
        redirect_to login_path
    end

    private
        def adherent_params
            params.require(:adherent).permit!
        end
end
