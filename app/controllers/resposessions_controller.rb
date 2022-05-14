class ResposessionsController < ApplicationController

    def index
        @respo = Respo.new
    end
    
    def sign_in_respo
        @respo = Respo.find_by(email: params[:respo][:email].downcase)
        if @respo && @respo.authenticate(params[:respo][:password])
            log_in(@respo)
            redirect_to @respo
        else
            flash[:danger] = "Responsable : La combinaison email/password est invalide"
            redirect_to '/sign_in_respo'
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
        redirect_to login_url
    end

end
