class DocumentsController < ApplicationController
    before_action :set_document, only: [:show, :edit, :update, :destroy]

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
        if @document.save
          flash[:success] = "Document successfully created"
          redirect_to @document
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
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

    private
        def set_document
            @document = Document.find(params[:id])
        end
        def document_params
            params.require(:document).permit!
        end
end
