class MaterielsController < ApplicationController
    before_action :set_materiel, only: [:show, :edit, :update, :destroy]

    # GET /materiels
    def index
        @materiels = Materiel.all
    end
    # GET /materiels/:id
    def show
        @materiel = Materiel.find()
    end
    # GET /materiels/new
    def new
        @materiel = Materiel.new
    end
    # GET /materiels/:id/edit
    def edit
    end
    # POST /materiels
    def create
        @materiel = Materiel.new(materiel_params)
        if @materiel.save
          flash[:success] = "materiel successfully created"
          redirect_to @materiel
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    # PATCH /materiels/:id/edit
    def update
        @materiel = Materiel.find(params[:id])
        if @materiel.update_attributes(materiel_params)
          flash[:success] = "materiel was successfully updated"
          redirect_to @materiel
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    # DESTROY /materiels/:id
    def destroy
        @materiel = Materiel.find(params[:id])
        if @materiel.destroy
            flash[:success] = 'materiel was successfully deleted.'
            redirect_to materiels_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to materiels_url
        end
    end

    private
        def set_materiel
            @materiel = Materiel.find(params[:id])
        end
        def materiel_params
            params.require(:materiel).permit!
        end
end
