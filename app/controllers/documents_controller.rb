class DocumentsController < ApplicationController
    before_action :set_document, only: [:show, :edit, :update, :destroy]
    before_action :current_adherent
    before_action :authenticate

    # GET /documents
    def index
        @documents = Document.all
    end
    # GET /documents/:id
    def show
    end
    # GET /documents/new
    def new
        @document = Document.new
    end
    # GET /documents/:id/edit
    def edit
    end
    # POST /documents
    def create
        @document = Document.new(document_params)
        @document.status = true
        if @document.save
          flash[:success] = "Document successfully created"
        else
            puts @document.errors.full_messages
          flash[:error] = "Something went wrong"
        end
        
        redirect_to documents_url

    end
    # PATCH /documents/:id/edit
    def update
        @document = Document.find(params[:id])
        if @document.update_attributes(document_params)
          flash[:success] = "Document was successfully updated"
          redirect_to @document
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    # DESTROY /documents/:id
    def destroy
        @document = Document.find(params[:id])
        if @document.destroy
            flash[:success] = 'Document was successfully deleted.'
            redirect_to documents_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to documents_url
        end
    end

    # EMPRUNTER /documents/:id/emprunter
    def emprunter_document
        @document = Document.find(params[:id])

        if @current_adherent.quota_document < 1
            flash[:danger] = "Votre quota sur les documents est saturée"
        else

            if @document.update_attribute(:status, false)  && @current_adherent.update_attribute(:quota_document, "#{@current_adherent.quota_document-1}")
                @current_adherent.documents.push(@document)
                flash[:success] = "Document a été emprunter"
            else
                flash[:danger] = "Something went wrong"
            end
        end

        redirect_to documents_url
        
    end
    # RENDRE /documents/:id/rendre
    def rendre_document
        @document = Document.find(params[:id])

        if @document.update_attribute(:status, true)  && @current_adherent.update_attribute(:quota_document, "#{@current_adherent.quota_document+1}")
            @current_adherent.documents.delete(@document)
            flash[:success] = "Document a été rendu"
        else
            flash[:danger] = "Something went wrong"
        end

        redirect_to documents_url
    end

    private
        def set_document
            @document = Document.find(params[:id])
        end
        def document_params
            params.require(:document).permit!
        end
end
