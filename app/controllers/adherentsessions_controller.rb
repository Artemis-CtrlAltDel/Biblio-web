class AdherentsessionsController < ApplicationController

    def index
        @adherent = Adherent.new
    end
    
    def sign_in_adherent
        @adherent = Adherent.find_by(email: params[:adherent][:email].downcase)
        if @adherent && @adherent.authenticate(params[:adherent][:password])
            log_in(@adherent)
            redirect_to @adherent
        else
            flash[:danger] = "Adherent : La combinaison email/password est invalide"
            redirect_to '/sign_in_adherent'
        end
    end

    def new
    end
    
    def show
    end
    
    def create
        #todo : sign up
    end

    def destroy
        log_out
        redirect_to '/sign_in_adherent'
    end

end
