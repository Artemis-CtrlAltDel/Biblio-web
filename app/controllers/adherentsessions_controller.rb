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
        puts 1
        @adherent = Adherent.new(adherent_params)
        puts 2
        if @adherent.save
            puts 3
          flash[:success] = "Adherent successfully created"
          redirect_to '/publics/index'
        else
            puts 4
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    

    def destroy
        log_out
        redirect_to '/sign_in_adherent'
    end

    private
        def adherent_params
            params.require(:adherent).permit
        end
end
