class MaterielsController < ApplicationController
    before_action :set_materiel, only: [:show, :edit, :update, :destroy]
    before_action :current_adherent
    before_action :authenticate

    # GET /materiels
    def index
        @materiels = Materiel.all
    end
    # GET /materiels/:id
    def show
        @materiel = Materiel.find(params[:id])
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
        @materiel.status = true
        if @materiel.save
          flash[:success] = "materiel successfully created"
          redirect_to materiels_url
        else
            puts @materiel.errors.full_messages
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

    # EMPRUNTER /materiels/:id/emprunter
    def emprunter_materiel
        @materiel = Materiel.find(params[:id])

        if @current_adherent.quota_materiel < 1
            flash[:danger] = "Votre quota sur les materiels est saturée"
        else

            if @materiel.update_attribute(:status, false)  && @current_adherent.update_attribute(:quota_materiel, "#{@current_adherent.quota_materiel-1}")
                @current_adherent.materiels.push(@materiel)
                flash[:success] = "Materiel a été emprunter"
            else
                flash[:danger] = "Something went wrong"
            end
        end

        redirect_to materiels_url
        
    end
    # RENDRE /materiels/:id/rendre
    def rendre_materiel
        @materiel = Materiel.find(params[:id])

        if @materiel.update_attribute(:status, true)  && @current_adherent.update_attribute(:quota_materiel, "#{@current_adherent.quota_materiel+1}")
            @current_adherent.materiels.delete(@materiel)
            flash[:success] = "Materiel a été rendu"
        else
            flash[:danger] = "Something went wrong"
        end

        redirect_to materiels_url
    end

    private
        def set_materiel
            @materiel = Materiel.find(params[:id])
        end
        def materiel_params
            params.require(:materiel).permit(:code, :type)
        end
end
