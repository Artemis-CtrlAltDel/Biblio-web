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
        @adherent = Adherent.new
    end
    
    def show
    end
    
    def create
        @adherent = Adherent.new(adherent_params)
        if @adherent.save
          flash[:success] = "Adherent successfully created"
          redirect_to sign_in_adherent_url
        else
          flash[:error] = "Something went wrong"
          redirect_to '/create_adherent'
        end
    end
    

    def destroy
        flash[:success] = "Vous avez déconnecter"
        log_out
        redirect_to '/sign_in_adherent'
    end

    private
        def adherent_params
            params.require(:adherent).permit!
        end
end
