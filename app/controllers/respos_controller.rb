class ResposController < ApplicationController
    before_action :set_respo, only: [:show, :edit, :update, :destroy, :show_adherents, :show_auteurs, :show_materiels]

    # GET /respos
    def index
        @respos = Respo.all
    end
    # GET /respos/:id
    def show
        @respo = current_respo
    end
    # GET /respos/new
    def new
        @respo = Respo.new
    end
    # GET /respos/:id/edit
    def edit
    end
    # POST /respos
    def create
        @respo = Respo.new(respo_params)
        if @respo.save
          flash[:success] = "Respo successfully created"
          redirect_to @respo
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    # PATCH /respos/:id
    def update
        @respo = Respo.find(params[:id])
        if @respo.update(respo_params)
          flash[:success] = "Respo was successfully updated"
          redirect_to @respo
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    # DESTROY /respos/:id
    def destroy
        @respo = Respo.find(params[:id])
        if @respo.destroy
            flash[:success] = 'Respo was successfully deleted.'
            redirect_to respos_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to respos_url
        end
    end
    
    def show_adherents
        @adherents = Adherent.all
    end
    def show_documents
        @documents = Document.all
    end
    def show_materiels
        @materiels = Materiel.all
    end

    private
        def set_respo
            if Respo.find_by(id: params[:id]).nil?
                flash[:danger] = "Respo avec id : "+params[:id]+" n'existe pas."
                redirect_to "/sign_in_respo"
            end

            if current_respo.nil?
                flash[:error] = "Vous n'êtes pas connecter"
                redirect_to '/sign_in_respo'
            elsif Respo.find_by(id: params[:id]).id != current_respo.id
                flash[:danger] = "Respo avec id : "+params[:id]+" n'est pas connecté."
                redirect_to "/sign_in_respo"
            end

            @adherent = current_respo
        end
        def respo_params
            params.require(:respo).permit!
        end
end
