class AdherentsController < ApplicationController
    before_action :authenticate, only: [:edit, :update, :show, :index]
    before_action :utilisateur_admin?, only: [:edit, :update, :show]
    # before_action :redirect_logged_in, only: [:new, :create]

  def index
    @adherents = Adherent.all
  end

  def show
    @adherent = Adherent.find params[:id]
  end

  def new
    if logged_in?
        redirect_to current_adherent
    end
    @adherent = Adherent.new
  end
  

  def create
    if logged_in?
        redirect_to current_adherent
    end
    @adherent = Adherent.new(adherent_params)
    if @adherent.save
      flash[:success] = "Adherent a été créé avec succès."
      redirect_to login_path
    else
      render :new
    end
  end
  
  def edit
    @adherent = Adherent.find(params[:id])
  end
  
  def update
    @adherent = Adherent.find(params[:id])
    success = Adherent.transaction do
      @adherent.update_attribute(:admin,params[:admin])
      attrs = adherent_params
      attrs.delete(:password) if attrs[:password].empty?
      for p,v in attrs
        if !@adherent.update_attribute(p,v)
          success = false
          raise ActiveRecord::Rollback
        end
      end
    end
    if success
      flash[:success] = "Profile a été mis à jour avec succès."
      redirect_to @adherent
    else
      render 'edit'
    end
  end
  

  def destroy
    @adherent = Adherent.find(params[:id])
    if @adherent.destroy
      flash[:success] = 'Adherent a été supprimé avec succès.'
      redirect_to adherents_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to adherents_url
    end
  end
  

  private

    def adherent_params
        if !@current_adherent.nil? && @current_adherent.admin?
            params.require(:adherent).permit(:nom,:prenom,:email,:password, :admin)
        else
            params.require(:adherent).permit(:nom,:prenom,:email,:password)
        end
    end

    def utilisateur_admin?
        @utilisateur = Adherent.find(params[:id])
        if not @current_adherent.admin? || @utilisateur == @current_adherent
          redirect_to(root_url)
        end
    end
    def document_params
        params.require(:document).permit!
    end
end
