class AdherentsController < ApplicationController
    before_action :set_adherent, only: [:show, :edit, :update, :destroy]
    before_action :is_respo, only: [:index]

    # GET /adherents
    def index
        @adherents = Adherent.all
    end
    # GET /adherents/:id
    def show
        @adherent = current_adherent
    end
    # GET /adherents/new
    def new
        @adherent = Adherent.new
    end
    # GET /adherents/:id/edit
    def edit
    end
    
    # POST /adherents
    def create
        @adherent = Adherent.new(adherent_params)
        if @adherent.save
          flash[:success] = "Adherent successfully created"
          redirect_to @adherent
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    # PATCH /adherents/:id
    def update
        @adherent = Adherent.find(params[:id])
        if @adherent.update(adherent_params)
          flash[:success] = "Adherent was successfully updated"
          redirect_to @adherent
        else
          flash[:danger] = "Something went wrong"
          render 'edit'
        end
    end
    
    # DESTROY /adherents/:id
    def destroy
        @adherent = Adherent.find(params[:id])
        if @adherent.destroy
            flash[:success] = 'Adherent was successfully deleted.'
            redirect_to adherents_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to adherents_url
        end
    end

    private
        def set_adherent
            if Adherent.find_by(id: params[:id]).nil?
                flash[:danger] = "Adherent avec id : "+params[:id]+" n'existe pas."
                redirect_to "/sign_in_adherent"
            end

            if current_adherent.nil?
                flash[:error] = "Vous n'êtes pas connecter"
                redirect_to '/sign_in_adherent'
            elsif Adherent.find_by(id: params[:id]).id != current_adherent.id
                flash[:danger] = "Adherent avec id : "+params[:id]+" n'est pas connecté."
                redirect_to "/sign_in_adherent"
            end

            @adherent = current_adherent
        end
        def is_respo?
            render 'index' unless current_respo.nil?
        end
        def adherent_params
            params.require(:adherent).permit!    
        end
        def document_params
            params.require(:document).permit!
        end
end
