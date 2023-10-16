class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  def index
    @contacts = Contact.all

    # render json: @contacts, root: true
    # retorna a raiz também, ex:
    # {
    #     "contact": {
    #         "id": 1,
    #         "name": "Fr. Woodrow Raynor",
    #         "email": "reina.cassin@strosin-schowalter.io",
    #         "birthdate": "2005-05-21",
    #         "created_at": "2023-10-03T01:11:49.053Z",
    #         "updated_at": "2023-10-03T01:11:49.053Z"
    #     }
    # }

    # restringir/excluir alguns campos
    # render json: @contacts, only: [:name, :email]
    # render json: @contacts, except: [:name, :email]

    # adicionar métodos em que posso adicionar novos atributos
    # render json: @contacts, methods: :author

    render json: @contacts
  end

  # GET /contacts/1
  def show
    # render json: @contact, except: :kind_id, include: :kind
    render json: @contact.to_br

    # render json: @contact
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(
        :name,
        :email,
        :birthdate,
        :kind_id
      )
    end
end
