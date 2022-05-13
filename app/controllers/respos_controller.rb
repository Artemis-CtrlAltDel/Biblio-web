class ResposController < ApplicationController
    before_action :set_admin, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_admin!

    # GET /respos
    def index
        @respos = Respo.all
    end
    # GET /respos/:id
    def show
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
        if @respo.update_attributes(respo_params)
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
            @respo = Respo.find(params[:id])
        end
        def respo_params
            params.require(:respo).permit!
        end
end
