class PotsController < ApplicationController
  # para ejcutar acciones antes del los metodos del controlador usar before action
  before_action :set_pot, only: [:show, :edit, :update, :destroy] # para especificar los metodos usamos el only y con una lista decimos cuales vamos a usar

  def index
    # listar mis pots mas recientes en la vista index
    current_page = params[:page] ||= 1
    @pots = Pot.where(visible: true).order('id DESC').paginate(page: current_page, per_page: 10)
  end

  def new
    @pot = Pot.new
  end

  def show
    # Se elimina la linea ya que al estar duplicada el before_action la ejecutara llamando al metodo set_pot de primeras
    # @pot = Pot.find params[:id] # obtener el pots mediante el parametro id
  end

  def update
    if @pot.update pot_params # esta definido en el private
      redirect_to pot_path(@pot), notice: "Tu pots Se actualizo con exito!" # si se cumple la condición se redirecciona a la imagen creada
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    # Se elimina la linea ya que al estar duplicada el before_action la ejecutara llamando al metodo set_pot de primeras
    # @pot = Pot.find params[:id] # obtener el pots mediante el parametro id
  end

  def create
    # obtener los valores que se aceptaran en la base de datos
    # solo los campos permitos en el formulario son los que estan como requeridos en pot_params
    @pot = Pot.create pot_params
    if @pot.persisted? # si el post se persiste de la orma correcta
      redirect_to pot_path(@pot), notice: "Acabas de postear una nueva imagen." # se usa redirect_to, y para dar una alerta al usuario se usa el notice que se debe configurar en la vista application del layout
    else
      render :new, status: :unprocessable_entity # renderiza al path new
    end
  end

  def destroy
    @pot.destroy
    redirect_to pots_path, status: :see_other, notice: "Acabas de eliminar una foto super!"
  end

  def search
    @q = params[:q]
    @pots = Pot.where("name LIKE ?", "%#{@q}%").where(visible: true)
  end

  private

  def set_pot # este metodo se ejecura primero antes que el crud
    # @pot = Pot.find params[:id] # Lo que venga del modelo Pot cuando se busca con el parametro id se iguala a la variable @pot que se utilizara para crear nuevos
    @pot = Pot.friendly.find params[:id]
  end

  def pot_params
    # en la petición se debe encontrar obligatoriamente el pot
    params.require(:pot).permit(:name, :description, :visible, :image, category_ids: [])
  end
end
