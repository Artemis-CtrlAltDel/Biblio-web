class ResposessionsController < ApplicationController

    def index
        @respo = Respo.new
    end
    
    def sign_in_respo
        @respo = Respo.find_by(email: params[:respo][:email].downcase)
        if @respo && @respo.authenticate(params[:respo][:password])
            sign_in(@respo)
            redirect_to @respo
        else
            flash[:danger] = "Responsable : La combinaison email/password est invalide"
            redirect_to '/sign_in_respo'
        end
    end

    def new
        @respo = Respo.new
    end
    
    def show
    end
    
    def create
        @respo = Respo.new(respo_params)
        if @respo.save
          flash[:success] = "Respo successfully created"
          redirect_to sign_in_adherent_url
        else
          flash[:error] = "Something went wrong"
          redirect_to '/create_respo'
        end
    end

    def destroy
        sign_out
        redirect_to '/sign_in_respo'
    end

    private
        def respo_params
            params.require(:respo).permit!
        end
end
