class PotsController < ApplicationController
  def index
    # listar mis pots mas recientes en la vista index
    @pots = Pot.where(visible:true).order('id DESC')
  end

  def new
    @pot = Pot.new
  end

  def show
    @pot = Pot.find params[:id] # obtener el pots mediante el parametro id
  end

  def create
    # obtener los valores que se aceptaran en la base de datos
    # solo los campos permitos en el formulario son los que estan como requeridos en pot_params
    @pot = Pot.create pot_params
    if @pot.persisted?  # si el post se persiste de la orma correcta
    redirect_to pots_path, notice:"Acabas de postear una nueva imagen." # se usa redirect_to, y para dar una alerta al usuario se usa el notice que se debe configurar en la vista application del layout
    else
      render :new, status: :unprocessable_entity # renderiza al path new
    end
  end

  private

  def pot_params
    # en la petición se debe encontrar obligatoriamente el pot
    params.require(:pot).permit(:name, :description, :visible)
  end
end
